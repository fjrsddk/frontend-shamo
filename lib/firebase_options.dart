// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCVt7XrFHt2t_3SX0LvCCdwtI-cDeK8DU4',
    appId: '1:416460454051:web:57ced0c60526b4830da716',
    messagingSenderId: '416460454051',
    projectId: 'shamo-aa9f8',
    authDomain: 'shamo-aa9f8.firebaseapp.com',
    storageBucket: 'shamo-aa9f8.appspot.com',
    measurementId: 'G-3E73RKCQ1S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDdMxBskdOT-9acQEWGu9gvLsNSTohtNc',
    appId: '1:416460454051:android:f9c311d6e11c7edd0da716',
    messagingSenderId: '416460454051',
    projectId: 'shamo-aa9f8',
    storageBucket: 'shamo-aa9f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcl5hj3ZmD11BPJtRONj0qHeVPLRIseXc',
    appId: '1:416460454051:ios:2def895aabc86b760da716',
    messagingSenderId: '416460454051',
    projectId: 'shamo-aa9f8',
    storageBucket: 'shamo-aa9f8.appspot.com',
    iosBundleId: 'com.neptus.shamo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcl5hj3ZmD11BPJtRONj0qHeVPLRIseXc',
    appId: '1:416460454051:ios:94d9d8df3bbfc1c30da716',
    messagingSenderId: '416460454051',
    projectId: 'shamo-aa9f8',
    storageBucket: 'shamo-aa9f8.appspot.com',
    iosBundleId: 'com.example.shamo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVt7XrFHt2t_3SX0LvCCdwtI-cDeK8DU4',
    appId: '1:416460454051:web:220554a4590ccd040da716',
    messagingSenderId: '416460454051',
    projectId: 'shamo-aa9f8',
    authDomain: 'shamo-aa9f8.firebaseapp.com',
    storageBucket: 'shamo-aa9f8.appspot.com',
    measurementId: 'G-ZM2LPM1TKK',
  );
}