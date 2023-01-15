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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdRLLtAxNLJSViWWl0iZ0M2SAVnsoba5s',
    appId: '1:280438115044:android:ecdad9d69839ed1add3af1',
    messagingSenderId: '280438115044',
    projectId: 'todo-d003d',
    databaseURL: 'https://todo-d003d-default-rtdb.firebaseio.com',
    storageBucket: 'todo-d003d.appspot.com',
    
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZrm1m2tCKkHikLX_CGiUhBm6MZITGZjI',
    appId: '1:280438115044:ios:7a3f4858cd39eff7dd3af1',
    messagingSenderId: '280438115044',
    projectId: 'todo-d003d',
    databaseURL: 'https://todo-d003d-default-rtdb.firebaseio.com',
    storageBucket: 'todo-d003d.appspot.com',
    iosClientId:
        '280438115044-ifd0ns1thfadbqv9s8id9g0b9t2av4dg.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
