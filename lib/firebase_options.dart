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
    apiKey: 'AIzaSyDIJCGcJ_unQv8IK-2MnxC8PI-prvh-Hf0',
    appId: '1:1098347219298:web:55118f90ef2f9edb10c43b',
    messagingSenderId: '1098347219298',
    projectId: 'final-project-lx-5b804',
    authDomain: 'final-project-lx-5b804.firebaseapp.com',
    storageBucket: 'final-project-lx-5b804.appspot.com',
    measurementId: 'G-BWJREGVFNR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnoTbMgsCNOnxt2da5-NVfr9x9nQFKkmg',
    appId: '1:1098347219298:android:88414a408f09db1210c43b',
    messagingSenderId: '1098347219298',
    projectId: 'final-project-lx-5b804',
    storageBucket: 'final-project-lx-5b804.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBi2uJV2Aa2CeD-ysifhG4-imhyxMYR24U',
    appId: '1:1098347219298:ios:933dffe27470ed4f10c43b',
    messagingSenderId: '1098347219298',
    projectId: 'final-project-lx-5b804',
    storageBucket: 'final-project-lx-5b804.appspot.com',
    iosBundleId: 'com.example.laundryBin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBi2uJV2Aa2CeD-ysifhG4-imhyxMYR24U',
    appId: '1:1098347219298:ios:933dffe27470ed4f10c43b',
    messagingSenderId: '1098347219298',
    projectId: 'final-project-lx-5b804',
    storageBucket: 'final-project-lx-5b804.appspot.com',
    iosBundleId: 'com.example.laundryBin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIJCGcJ_unQv8IK-2MnxC8PI-prvh-Hf0',
    appId: '1:1098347219298:web:4fd4f60e01e44fe510c43b',
    messagingSenderId: '1098347219298',
    projectId: 'final-project-lx-5b804',
    authDomain: 'final-project-lx-5b804.firebaseapp.com',
    storageBucket: 'final-project-lx-5b804.appspot.com',
    measurementId: 'G-9EMDTFNF6R',
  );
}
