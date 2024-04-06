
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:braucoe/data/models/student_card.dart';

class ClassDetailsAPI {
  Future<List<StudentCard>> getAllStudents() async {
    List<StudentCard> allStudentsList = [];
    SupabaseClient supabaseClient = Supabase.instance.client;
    final studentsData = await supabaseClient
        .from('student_details')
        .select('''*, student_qualifications(*)''');
    for (final student in studentsData) {
      StudentCard studentCard = StudentCard(
        studentRegNo: student['student_registration_no'] as int,
        studentName: student['student_name'] as String,
        phoneNo: student['mobile_no'] as int,
        admissionNo: student['student_qualifications']['admission_no'] as int,
      );
      allStudentsList.add(studentCard);
    }
    return allStudentsList;
  }
}
