
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:braucoe/providers/student_data_provider.dart';
import 'package:braucoe/screens/fee_details/fee_info.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:braucoe/widgets/fees_bar.dart';

class FeeDetailsScreen extends StatefulWidget {

  const FeeDetailsScreen({super.key});

  @override
  State<FeeDetailsScreen> createState() => _FeeDetailsScreenState();
}

class _FeeDetailsScreenState extends State<FeeDetailsScreen> {
  SharedPreferences? prefs;

  Future initializeSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  int dueAmount = 0;

  @override
  Widget build(BuildContext context) {
    dueAmount = 140000 -
        Provider.of<StudentData>(context, listen: false).feeDetails!.getYear1FeePaid -
        Provider.of<StudentData>(context, listen: false).feeDetails!.getYear2FeePaid -
        Provider.of<StudentData>(context, listen: false).feeDetails!.getYear3FeePaid -
        Provider.of<StudentData>(context, listen: false).feeDetails!.getYear4FeePaid;
    print(prefs?.getInt(StudentLogin.isLoggedIn));
    return Scaffold(
      body: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF382E1E),
                              ),
                            ),
                            Image.asset('assets/images/fee_details.png'),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Fee Details',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'LibreFranklin-Regular',
                                    color: Color(0xFF382E1E),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Check your year wise fee details.\n(filled region reflects amount paid)',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'LibreFranklin-Regular',
                                        color: Color(0xFF382E1E),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const FeeInfoScreen()));
                                      },
                                      icon: const Icon(
                                        Icons.info,
                                        color: Color(0xFF382E1E),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                      Provider.of<StudentData>(context, listen: false).feeDetails!.getYear1FeePaid,
                                      year: '1st year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                      Provider.of<StudentData>(context, listen: false).feeDetails!.getYear2FeePaid,
                                      year: '2nd year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                      Provider.of<StudentData>(context, listen: false).feeDetails!.getYear3FeePaid,
                                      year: '3rd year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                      Provider.of<StudentData>(context, listen: false).feeDetails!.getYear4FeePaid,
                                      year: '4th year'),
                                ),
                                const Spacer(),
                                Center(
                                  child: Text(
                                    'Total Due : ₹$dueAmount',
                                    style: const TextStyle(
                                      color: Color(0xFFCF0000),
                                      fontSize: 20,
                                      fontFamily: 'LibreFranklin-Regular',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
    );
  }
}
