
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:braucoe/data/models/result_info.dart';

class ResultAPI
{
  static List result =[];
  static double SGPA = 0;
  static List studentResultDetails = [];
  Map<String, int> semesterDetails = {
    "semester_1" : 6,
    "semester_2" : 10,
    "semester_3" : 10,
    "semester_4" : 9,
    "semester_5" : 9,
    "semester_6" : 8,
    "semester_7" : 4,
    "semester_8" : 3,
  };
  Future getResult(String semester,int reg_no) async
  {
    result.clear();
    SupabaseClient supabaseClient = Supabase.instance.client;
    final studentResults = (await supabaseClient.from('$semester').select().eq('student_registration_no', reg_no))[0];
    SGPA = studentResults['sgpa'];
    int? noOfSubjects = semesterDetails[semester];
    for(var i = 1; i <= noOfSubjects!; i++)
    {
      ResultInfo resultInfo = ResultInfo();
      resultInfo.setPapName = studentResults["pap${i}n"] as String;
      resultInfo.setPapGR = studentResults["pap${i}gr"] as String;
      resultInfo.setPapGRP = studentResults["pap${i}grp"] as int;
      result.add(resultInfo);
    }
    return studentResults;
  }
}
