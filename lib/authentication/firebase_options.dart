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
    apiKey: 'AIzaSyBtlDJHCLSBT1XNmJyAV-Cr-Al36N8MJog',
    appId: '1:238906833613:web:fe43b154cca4ed31418784',
    messagingSenderId: '238906833613',
    projectId: 'book-a-ride-c094e',
    authDomain: 'book-a-ride-c094e.firebaseapp.com',
    storageBucket: 'book-a-ride-c094e.appspot.com',
    measurementId: 'G-Q6MHW6TFMW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASnreIA-qZ916PVBhf9NFx80C3o2EO81c',
    appId: '1:238906833613:android:9e0cc0fe839b25b4418784',
    messagingSenderId: '238906833613',
    projectId: 'book-a-ride-c094e',
    storageBucket: 'book-a-ride-c094e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlsQIx7pqvg8zAoiAY2sXHjEl5u6Vtlcg',
    appId: '1:238906833613:ios:241bb96e0f3363e9418784',
    messagingSenderId: '238906833613',
    projectId: 'book-a-ride-c094e',
    storageBucket: 'book-a-ride-c094e.appspot.com',
    iosBundleId: 'com.example.bookARide',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlsQIx7pqvg8zAoiAY2sXHjEl5u6Vtlcg',
    appId: '1:238906833613:ios:69ee4ecd545cb344418784',
    messagingSenderId: '238906833613',
    projectId: 'book-a-ride-c094e',
    storageBucket: 'book-a-ride-c094e.appspot.com',
    iosBundleId: 'com.example.bookARide.RunnerTests',
  );
}
