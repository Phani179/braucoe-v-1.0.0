
import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:braucoe/providers/profile_image_notifier.dart';
import 'package:braucoe/utilities/firebase_functions.dart';
import 'package:braucoe/data/apis/login_api.dart';
import 'package:braucoe/widgets/shimmer_effect/home_page_shimmer_loading.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utilities/images.dart';
import 'package:braucoe/providers/student_data_provider.dart';
import 'logo_screen.dart';

LatLng? kCurrentLocation;

class Handler extends StatefulWidget {
  static const String routeName = '/handler';
  static bool? loginStatus;
  static String? studentName;

  @override
  State<StatefulWidget> createState() => _Handler();
}

class _Handler extends State<Handler> {
  late SharedPreferences prefs;
  bool? isLoggedIn = false;
  late Future<bool> toGo;

  @override
  void initState()  {
    // TODO: implement initState
    toGo = whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Handler');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: HomePage()
      body: FutureBuilder(
          future: toGo,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const HomePageShimmerLoading();
            }
            if (snapshot.hasData) {
              if (isLoggedIn != null) {
                if (isLoggedIn == true) {
                  var studentId = prefs.getInt(StudentLogin.studentId);
                  LoginAPI loginAPI = LoginAPI();
                  return FutureBuilder(
                    future: loginAPI.getStudent(studentId!),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Home Page Rendering.
                        return const HomePageShimmerLoading();
                      }
                      if (snapshot.hasData) {
                        Provider.of<StudentData>(context, listen: false)
                            .updateStudentData(snapshot.data);
                        FirebaseFunctions.saveToFirestore(
                          location: kCurrentLocation!,
                          registrationId:
                              Provider.of<StudentData>(context, listen: false)
                                  .studentDetails!
                                  .studentId,
                        );
                        Handler.studentName =
                            Provider.of<StudentData>(context, listen: false)
                                .studentDetails!
                                .student_name;
                        LogoScreen.isLoggedIn = true;
                        return const LogoScreen();
                      } else {
                        return const HomePageShimmerLoading();
                      }
                    },
                  );
                } else {
                  LogoScreen.isLoggedIn = false;
                  return const LogoScreen();
                }
              } else {
                LogoScreen.isLoggedIn = false;
                return const LogoScreen();
              }
            }
            return const CircularProgressIndicator();
          }),
    );
  }

  Future<bool> whereToGo() async {
    _enableLocationServices();
    LocationData locationData = await FirebaseFunctions.getCurrentLocation();
    kCurrentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool(StudentLogin.isLoggedIn);
    Handler.loginStatus = isLoggedIn ?? false;
    return true;
  }
}

Future<bool> _enableLocationServices() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus permissionStatus;
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return false;
    }
  }
  permissionStatus = await location.hasPermission();
  if (permissionStatus == PermissionStatus.denied) {
    permissionStatus = await location.requestPermission();
    if (permissionStatus == PermissionStatus.denied) {
      return false;
    }
  }
  return true;
}

Future<String> loadProfileImage(int studentId, BuildContext ctx) async {
  SupabaseClient supabaseClient = Supabase.instance.client;
  Uint8List? imageFile = await supabaseClient.storage
      .from('student-profile-photo')
      .download('$studentId.png')
      .onError((error, stackTrace) async {
    SupabaseClient supabaseClient = Supabase.instance.client;
    ByteData data = await rootBundle.load(Images.profileImage);
    File file = File('${(await getApplicationDocumentsDirectory()).path}/profile.png');
    file.writeAsBytesSync(data.buffer.asUint8List());
    await supabaseClient.storage.from('student-profile-photo').upload('${studentId}.png', file);
    return data.buffer.asUint8List();
  } );
  Provider.of<ProfileImageNotifier>(ctx, listen: false).setImage(imageFile);
  return "Success";
}