
class StudentCard {
  int? studentRegNo;

  String? studentName;

  int? phoneNo;

  int? admissionNo;

  get getStudentRegNo => studentRegNo;

  get getStudentName => studentName;

  get getPhoneNo => phoneNo;

  get getAdmissionNo => admissionNo;

  set setStudentName(String studentName) {
    this.studentName = studentName;
  }

  set setStudentRegNo(int studentRegNo) {
    this.studentRegNo = studentRegNo;
  }

  set setPhoneNo(int phoneNo) {
    this.phoneNo = phoneNo;
  }

  set setAdmissionNo(int admissionNo) {
    this.admissionNo = admissionNo;
  }

  StudentCard({
    required this.studentRegNo,
    required this.studentName,
    required this.phoneNo,
    required this.admissionNo,
  });

  factory StudentCard.fromJson(Map<String, Object> data) {
    return StudentCard(
      studentRegNo: data['student_registration_no'] as int,
      studentName: data['student_name'] as String,
      phoneNo: data['mobile_no'] as int,
      admissionNo: data['admission_no'] as int,
    );
  }
}
