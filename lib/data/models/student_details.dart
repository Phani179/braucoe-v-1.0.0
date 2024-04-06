
class StudentDetails
{
  late int _studentId;
  late String _studentName;
  late String _fatherName;
  late String _gender;
  late String _branch;
  late int _mobileNo;
  late String _emailId;
  late String _dateOfWillingness;

  StudentDetails(){}

  String get branch => _branch;

  set branch(String value) {
    _branch = value;
  }

  String get dateOfWillingness => _dateOfWillingness;

  int get studentId => _studentId;

  String get student_name => _studentName;

  int get mobile_no => _mobileNo;

  String get emailId => _emailId;

  String get gender => _gender;

  String get father_name => _fatherName;

  set father_name(String value) {
    _fatherName = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set mobile_no(int value) {
    _mobileNo = value;
  }

  set emailId(String value){
    _emailId = value;
  }

  set student_name(String value) {
    _studentName = value;
  }

  set studentId(int value) {
    _studentId = value;
  }

  set dateOfWillingness(String value) {
    _dateOfWillingness = value;
  }

  StudentDetails.parameterizedConstructor(
      this._studentId,
    this._studentName,
    this._branch,
    this._fatherName,
    this._mobileNo,
    this._emailId,
    this._gender,
    this._dateOfWillingness
      );

  factory StudentDetails.fromMap(Map<String, dynamic> json)
  {
    return StudentDetails.parameterizedConstructor(
        json["student_registration_no"],
        json["student_name"],
        json["branch"],
        json["father_name"],
        json["mobile_no"],
        json["email_id"],
        json["gender"],
      json["date_of_willingness"]
        );
  }
}