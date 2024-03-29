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
    apiKey: 'AIzaSyCHp76mW--ZrR_kpGOihkeeHO2rt_cPGpc',
    appId: '1:4825062996:web:907031fedd0f2773b4d7c1',
    messagingSenderId: '4825062996',
    projectId: 'mynotes-77319',
    authDomain: 'mynotes-77319.firebaseapp.com',
    storageBucket: 'mynotes-77319.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByu-axrHKw-HRCyc_sN5_fSEVqM0AA66k',
    appId: '1:4825062996:android:374efc3d013c19cdb4d7c1',
    messagingSenderId: '4825062996',
    projectId: 'mynotes-77319',
    storageBucket: 'mynotes-77319.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdbU75UuLbeButAOt-6nW9Ztzz-k4WNEU',
    appId: '1:4825062996:ios:24d863f32229a354b4d7c1',
    messagingSenderId: '4825062996',
    projectId: 'mynotes-77319',
    storageBucket: 'mynotes-77319.appspot.com',
    iosBundleId: 'com.example.first',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdbU75UuLbeButAOt-6nW9Ztzz-k4WNEU',
    appId: '1:4825062996:ios:177fc2c7b1ac6095b4d7c1',
    messagingSenderId: '4825062996',
    projectId: 'mynotes-77319',
    storageBucket: 'mynotes-77319.appspot.com',
    iosBundleId: 'com.example.first.RunnerTests',
  );
}
