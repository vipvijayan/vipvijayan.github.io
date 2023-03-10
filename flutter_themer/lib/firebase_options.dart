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
    apiKey: 'AIzaSyDFkR1sMLXJC5K2MCaEoRJdaF8yBMedKHs',
    appId: '1:85607312637:web:188716fb926c5545ae6294',
    messagingSenderId: '85607312637',
    projectId: 'flutter-themer-app',
    authDomain: 'flutter-themer-app.firebaseapp.com',
    storageBucket: 'flutter-themer-app.appspot.com',
    measurementId: 'G-S7VZH6F66L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAq26LWyYbaDZNqusoPPz_0aEjOQGY5LNY',
    appId: '1:85607312637:android:5507274ef465a912ae6294',
    messagingSenderId: '85607312637',
    projectId: 'flutter-themer-app',
    storageBucket: 'flutter-themer-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-3OiaQj05xkkBx35F8qXyTd5vX4w9CRw',
    appId: '1:85607312637:ios:f05a79e7cf56bfb0ae6294',
    messagingSenderId: '85607312637',
    projectId: 'flutter-themer-app',
    storageBucket: 'flutter-themer-app.appspot.com',
    iosClientId: '85607312637-pa79povkug04q8i6hhrat8bq4lr2utmt.apps.googleusercontent.com',
    iosBundleId: 'com.flutterthemer.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-3OiaQj05xkkBx35F8qXyTd5vX4w9CRw',
    appId: '1:85607312637:ios:f05a79e7cf56bfb0ae6294',
    messagingSenderId: '85607312637',
    projectId: 'flutter-themer-app',
    storageBucket: 'flutter-themer-app.appspot.com',
    iosClientId: '85607312637-pa79povkug04q8i6hhrat8bq4lr2utmt.apps.googleusercontent.com',
    iosBundleId: 'com.flutterthemer.app',
  );
}
