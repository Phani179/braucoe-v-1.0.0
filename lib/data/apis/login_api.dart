
import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class LoginAPI {

  Future<dynamic> getStudent(int studentId) async {
    SupabaseClient supabaseClient = Supabase.instance.client;
    final studentData = (await supabaseClient
        .from('student_details')
        .select('''*, student_personal_info(*), student_qualifications(*), fee_details(*)''').eq('student_registration_no', studentId))[0];
    return studentData;
  }
}
