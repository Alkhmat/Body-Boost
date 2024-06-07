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
    apiKey: 'AIzaSyDAsSzo_Ze7UacNLlz_eHix2rezVCoqAvU',
    appId: '1:1070485307534:web:03a33c9a76af59ea3c89df',
    messagingSenderId: '1070485307534',
    projectId: 'body-boost-ff0aa',
    authDomain: 'body-boost-ff0aa.firebaseapp.com',
    storageBucket: 'body-boost-ff0aa.appspot.com',
    measurementId: 'G-GC07B26GJ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6Pef-vbM6hM6fdq_olOAS_SqIvqr2zG4',
    appId: '1:1070485307534:android:07efcbc37e3417933c89df',
    messagingSenderId: '1070485307534',
    projectId: 'body-boost-ff0aa',
    storageBucket: 'body-boost-ff0aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAitiYTYy0jPCwSjpolurnWhijKxR-N1sk',
    appId: '1:1070485307534:ios:e90dfb2fa912ee893c89df',
    messagingSenderId: '1070485307534',
    projectId: 'body-boost-ff0aa',
    storageBucket: 'body-boost-ff0aa.appspot.com',
    iosBundleId: 'com.example.bodyBoost',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAitiYTYy0jPCwSjpolurnWhijKxR-N1sk',
    appId: '1:1070485307534:ios:e90dfb2fa912ee893c89df',
    messagingSenderId: '1070485307534',
    projectId: 'body-boost-ff0aa',
    storageBucket: 'body-boost-ff0aa.appspot.com',
    iosBundleId: 'com.example.bodyBoost',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAsSzo_Ze7UacNLlz_eHix2rezVCoqAvU',
    appId: '1:1070485307534:web:8cac34f85e64644c3c89df',
    messagingSenderId: '1070485307534',
    projectId: 'body-boost-ff0aa',
    authDomain: 'body-boost-ff0aa.firebaseapp.com',
    storageBucket: 'body-boost-ff0aa.appspot.com',
    measurementId: 'G-NCR8400ECV',
  );
}
