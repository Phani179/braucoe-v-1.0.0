
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class ImageAPI
{
    Future<String> uploadImage(int studentId,File? imageFile) async
    {
      if(imageFile == null)
        {
          return "No file selected";
        }
      SupabaseClient supabaseClient = Supabase.instance.client;
      final response = await supabaseClient.storage.from('student-profile-photo').update('${studentId}.png', imageFile);
      return response;
    }
}

