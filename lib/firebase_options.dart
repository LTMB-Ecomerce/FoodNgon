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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDhAG34jQJIxHBcVWYVEMaZALMOmhRgfJI',
    appId: '1:939877043506:web:179e4fc9ef84c76cb8db2b',
    messagingSenderId: '939877043506',
    projectId: 'fooddelivery-df4d9',
    authDomain: 'fooddelivery-df4d9.firebaseapp.com',
    storageBucket: 'fooddelivery-df4d9.appspot.com',
    measurementId: 'G-QHS884CYYE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBNoB9CukqTLwXiaI21DoN__XeV0dz6_s',
    appId: '1:939877043506:android:6ad89dad0dff09e2b8db2b',
    messagingSenderId: '939877043506',
    projectId: 'fooddelivery-df4d9',
    storageBucket: 'fooddelivery-df4d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-QqqqrbgL0hT-SvYJW0cKOs7C4iDibOs',
    appId: '1:939877043506:ios:c2c50d3d07d5128bb8db2b',
    messagingSenderId: '939877043506',
    projectId: 'fooddelivery-df4d9',
    storageBucket: 'fooddelivery-df4d9.appspot.com',
    iosBundleId: 'com.example.food',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhAG34jQJIxHBcVWYVEMaZALMOmhRgfJI',
    appId: '1:939877043506:web:4b388613f754ef33b8db2b',
    messagingSenderId: '939877043506',
    projectId: 'fooddelivery-df4d9',
    authDomain: 'fooddelivery-df4d9.firebaseapp.com',
    storageBucket: 'fooddelivery-df4d9.appspot.com',
    measurementId: 'G-Q02XYGFJD2',
  );

}