
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:braucoe/widgets/shimmer_effect/mail_and_reset_pwd_shimmer_loading.dart';
import '../../data/apis/mail_api.dart';
import '../../providers/student_data_provider.dart';

class MailSendingPage extends StatelessWidget {
  MailSendingPage(this.subject, this.message, {super.key});

  String subject;
  String message;
  MailAPI mailAPI = MailAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mailAPI.sendMail(
         studentId:  Provider.of<StudentData>(context, listen: false).studentDetails?.studentId ?? 00000000, subject: subject, body: message, recieverMail: 'Phanireddi7989@gmail.com'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MailandResetPwdShimmerLoading();
        } else if (snapshot.hasData) {
          return AlertDialog(
            content: SizedBox(
              height: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Done.png"),
                  const Text(
                    "Successfully submitted",
                    style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: const Color(0xFFCF9F69), // #00512D
                    // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Librefranklin-Regular",
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
        return const AlertDialog(
          content: Text("Failed"),
        );
      },
    );
  }
}
