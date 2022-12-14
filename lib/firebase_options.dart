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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRZy2ZWIHtNxZhrQoJjwQoL29dlGknAik',
    appId: '1:335208808349:web:655abbfe6344be415c3974',
    messagingSenderId: '335208808349',
    projectId: 'podclass-7089a',
    authDomain: 'podclass-7089a.firebaseapp.com',
    storageBucket: 'podclass-7089a.appspot.com',
    measurementId: 'G-7FJDLTE5Z9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7E89YYJQlivHlM6Lxlif4rV5EimvB_7E',
    appId: '1:335208808349:android:463e98ae83ebc9a85c3974',
    messagingSenderId: '335208808349',
    projectId: 'podclass-7089a',
    storageBucket: 'podclass-7089a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgN-wdlTTizsRaX9mGE5Lt9-QmaBrnDtk',
    appId: '1:335208808349:ios:48530d1f5248543e5c3974',
    messagingSenderId: '335208808349',
    projectId: 'podclass-7089a',
    storageBucket: 'podclass-7089a.appspot.com',
    iosClientId: '335208808349-t2l4ra4bbteaochrm2iqttle2q8f8jr4.apps.googleusercontent.com',
    iosBundleId: 'com.example.audioTeste',
  );
}
