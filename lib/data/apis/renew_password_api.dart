
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class RenewPasswordAPI {
  Future renewPassword(int studentId, String newPassword) async {
    SupabaseClient supabaseClient = Supabase.instance.client;
    HashPassword hashPassword = HashPassword();
    String hashedPassword = hashPassword.hashPassword(newPassword);
    await supabaseClient.from('student_personal_info').update({'password' : hashedPassword}).match({'student_registration_no' : studentId});
    return 'Updated';
  }
}

class HashPassword {
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes);
    return hashedPassword.toString();
  }
}
