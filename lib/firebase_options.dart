// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBVFPIK7yBPt-agnQJKaoIHWP2J6w-timU',
    appId: '1:1043534730937:web:adb86644926718d5272d68',
    messagingSenderId: '1043534730937',
    projectId: 'braucoe-33c92',
    authDomain: 'braucoe-33c92.firebaseapp.com',
    databaseURL: 'https://braucoe-33c92-default-rtdb.firebaseio.com',
    storageBucket: 'braucoe-33c92.appspot.com',
    measurementId: 'G-VRW4CKNM8Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAI5zqlpWOXChecbxoiuBJ5_Vr41jviQC0',
    appId: '1:1043534730937:android:234f9fe70194beb9272d68',
    messagingSenderId: '1043534730937',
    projectId: 'braucoe-33c92',
    databaseURL: 'https://braucoe-33c92-default-rtdb.firebaseio.com',
    storageBucket: 'braucoe-33c92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBLiC2i--XfdfFB3bqNf40dR3N1QxuDK8',
    appId: '1:1043534730937:ios:4145f5ea91ea8b70272d68',
    messagingSenderId: '1043534730937',
    projectId: 'braucoe-33c92',
    databaseURL: 'https://braucoe-33c92-default-rtdb.firebaseio.com',
    storageBucket: 'braucoe-33c92.appspot.com',
    iosBundleId: 'com.example.restapiusage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBLiC2i--XfdfFB3bqNf40dR3N1QxuDK8',
    appId: '1:1043534730937:ios:4145f5ea91ea8b70272d68',
    messagingSenderId: '1043534730937',
    projectId: 'braucoe-33c92',
    databaseURL: 'https://braucoe-33c92-default-rtdb.firebaseio.com',
    storageBucket: 'braucoe-33c92.appspot.com',
    iosBundleId: 'com.example.restapiusage',
  );
}