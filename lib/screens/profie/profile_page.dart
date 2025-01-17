
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../utilities/customized_paint.dart';
import 'package:braucoe/providers/student_data_provider.dart';
import 'package:braucoe/widgets/profile_items.dart';
import '../../widgets/profile_image_generator.dart';


class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomPaint(
            painter: CustomizedPaint(),
            child: Consumer<StudentData>(
              builder: (context, studentData, child) {
                return Container(
                  margin: EdgeInsets.only(left: width * 0.02, right: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.015,
                      ),
                      GestureDetector(
                        child: const Icon(Icons.arrow_back, size: 23,),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.1,
                          ),
                          ProfileImageGenerator(radius: 70,),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.05, right: width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),

                            // Name.
                            Text(
                              "${studentData.studentDetails?.student_name}",
                              style: const TextStyle(
                                fontFamily: "LibreFranklin-SemiBold",
                                color: Color(0xFF382E1E),
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),

                            // Registration no.
                            Text(
                              "Registration no : ${studentData.studentDetails?.studentId}",
                              style: const TextStyle(
                                fontFamily: "LibreFranklin-Medium",
                                color: Color(0xFF382E1E),
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Center(
                              child: SizedBox(
                                  width : width * 0.7,
                                child: const Divider(thickness: 2,)),
                            ),

                            // Personal Details
                            const Text(
                              "Personal Details",
                              style: TextStyle(
                                  fontFamily: "LibreFranklin-SemiBold",
                                  fontSize: 20,
                                  color: Color(0xFF00512D),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF00512D),
                                  decorationStyle: TextDecorationStyle.solid
                              ),

                            ),
                            SizedBox(
                              height: height * 0.008,
                            ),

                            Container(
                              margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Father Name.
                                  ProfileRecord(title: 'Father Name : ', data: '${studentData.studentDetails?.father_name}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Date of Birth.
                                  ProfileRecord(title: 'Date of Birth(yy/mm/dd) : ', data: '${studentData.personalInfo?.dateOfBirth}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Category
                                  ProfileRecord(title: 'Category : ', data: '${studentData.personalInfo?.category}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Gender
                                  ProfileRecord(title: 'Gender : ', data: '${studentData.studentDetails?.gender}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Mobile Number
                                  ProfileRecord(title: 'Mobile no. : ', data: '${studentData.studentDetails?.mobile_no}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Email Id
                                  ProfileRecord(title: 'E-mail ID : ', data: '${studentData.studentDetails?.emailId}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Is Physical Handicap.
                                  ProfileRecord(title: 'Is Physical Handicap. : ', data: '${studentData.personalInfo?.isPhysicalHandicap}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Address
                                  ProfileRecord(title: 'Address : ', data: '${studentData.personalInfo?.permanentAddress}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  Center(
                                    child: SizedBox(
                                        width : width * 0.7,
                                        child: Divider(thickness: 2,)),
                                  ),

                                  // SSC Hall Ticket No.
                                  ProfileRecord(title: 'SSC Hall Ticket No. : ', data: '${studentData.studentQualifications?.sscHallTicketNo}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),
                                  //Intermediate Hall Ticket No.
                                  ProfileRecord(title: 'Intermediate Hall Ticket No. : ', data: '${studentData.studentQualifications?.interMediateHallTicketNo}'),

                                  Center(
                                    child: SizedBox(
                                        width : width * 0.7,
                                        child: const Divider(thickness: 2,)),
                                  ),
                                ],
                              ),
                            ),

                            const Text(
                              "EAMCET Details",
                              style: TextStyle(
                                  fontFamily: "LibreFranklin-SemiBold",
                                  fontSize: 20,
                                  color: Color(0xFF00512D),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF00512D),
                                  decorationStyle: TextDecorationStyle.solid
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),

                                  // EAMCET Hall Ticket  No.
                                  ProfileRecord(title: 'EAMCET Hall Ticket  No. : ', data: '${studentData.studentQualifications?.eamcetHallTicketNo}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // EAMCET Rank
                                  ProfileRecord(title: 'EAMCET Rank : ', data: '${studentData.studentQualifications?.eamcetRank}'),

                                  Center(
                                    child: SizedBox(
                                        width : width * 0.7,
                                        child: const Divider(thickness: 2,)),
                                  ),
                                ],
                              ),
                            ),

                            const Text(
                              "Academic Details",
                              style: TextStyle(
                                  fontFamily: "LibreFranklin-SemiBold",
                                  fontSize: 20,
                                  color: Color(0xFF00512D),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF00512D),
                                  decorationStyle: TextDecorationStyle.solid
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),

                                  //Admission No
                                  ProfileRecord(title: 'Admission No. : ', data: '${studentData.studentQualifications?.admissionNo}'),

                                  SizedBox(
                                    height: height * 0.003,
                                  ),

                                  // Date of Willingness.
                                  ProfileRecord(title: 'Date of Willingness(yy/mm/dd) : ', data: '${studentData.studentDetails?.dateOfWillingness}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

