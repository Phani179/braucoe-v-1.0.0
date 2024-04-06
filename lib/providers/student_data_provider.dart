
import 'package:flutter/material.dart';

import 'package:braucoe/data/models/fee_details.dart';
import '../data/models/student_details.dart';
import '../data/models/student_personal_info.dart';
import '../data/models/student_qualifications.dart';

class StudentData extends ChangeNotifier
{
  StudentDetails? studentDetails;
  StudentPersonalInfo? personalInfo;
  StudentQualifications? studentQualifications;
  FeeDetails? feeDetails;

  void updateStudentData(Map<String, dynamic> studentData){
    studentDetails = StudentDetails.fromMap(studentData);
    personalInfo = StudentPersonalInfo.fromMap(studentData["student_personal_info"]);
    studentQualifications = StudentQualifications.fromMap(studentData["student_qualifications"]);
    feeDetails = FeeDetails.fromJson(studentData['fee_details']);
    notifyListeners();
  }
}