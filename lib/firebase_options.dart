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
    apiKey: 'AIzaSyC912FROOS0yXnvDvlHxh6YpQqzVKw2LQY',
    appId: '1:472358422746:web:c09d545c05e84bc52afde3',
    messagingSenderId: '472358422746',
    projectId: 'depimovieapp',
    authDomain: 'depimovieapp.firebaseapp.com',
    storageBucket: 'depimovieapp.appspot.com',
    measurementId: 'G-LPRTW83G9F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD245_2wINdBygvVQwWyjWxgB_XUFSZ7pk',
    appId: '1:472358422746:android:ba9bd8e0cd7a1d042afde3',
    messagingSenderId: '472358422746',
    projectId: 'depimovieapp',
    storageBucket: 'depimovieapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4hV7VrziPR1RZ0Nga6CF-DsT3pDCauuQ',
    appId: '1:472358422746:ios:c080410804b4cd5c2afde3',
    messagingSenderId: '472358422746',
    projectId: 'depimovieapp',
    storageBucket: 'depimovieapp.appspot.com',
    iosBundleId: 'com.example.depiMovieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4hV7VrziPR1RZ0Nga6CF-DsT3pDCauuQ',
    appId: '1:472358422746:ios:c080410804b4cd5c2afde3',
    messagingSenderId: '472358422746',
    projectId: 'depimovieapp',
    storageBucket: 'depimovieapp.appspot.com',
    iosBundleId: 'com.example.depiMovieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC912FROOS0yXnvDvlHxh6YpQqzVKw2LQY',
    appId: '1:472358422746:web:dc7b43003288e0ed2afde3',
    messagingSenderId: '472358422746',
    projectId: 'depimovieapp',
    authDomain: 'depimovieapp.firebaseapp.com',
    storageBucket: 'depimovieapp.appspot.com',
    measurementId: 'G-81R25ZBW2Q',
  );
}
