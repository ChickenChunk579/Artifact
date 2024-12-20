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
    apiKey: 'AIzaSyAmfiXy6-G3yTyi-bxgFqVmRrPKjKWio4k',
    appId: '1:700231469008:web:964a944049fd6a74879bd5',
    messagingSenderId: '700231469008',
    projectId: 'artifact-engine',
    authDomain: 'artifact-engine.firebaseapp.com',
    storageBucket: 'artifact-engine.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeoGsycitzy9w1NfHVeZ_20GFFsU1Q5RE',
    appId: '1:700231469008:android:0adce47071ab8b69879bd5',
    messagingSenderId: '700231469008',
    projectId: 'artifact-engine',
    storageBucket: 'artifact-engine.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZiQvlcBV5beaPJ-5KGKNq_Bvk7LHtmtU',
    appId: '1:700231469008:ios:ed381aa9d06d6166879bd5',
    messagingSenderId: '700231469008',
    projectId: 'artifact-engine',
    storageBucket: 'artifact-engine.firebasestorage.app',
    iosBundleId: 'com.example.flutterEngine',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZiQvlcBV5beaPJ-5KGKNq_Bvk7LHtmtU',
    appId: '1:700231469008:ios:ed381aa9d06d6166879bd5',
    messagingSenderId: '700231469008',
    projectId: 'artifact-engine',
    storageBucket: 'artifact-engine.firebasestorage.app',
    iosBundleId: 'com.example.flutterEngine',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmfiXy6-G3yTyi-bxgFqVmRrPKjKWio4k',
    appId: '1:700231469008:web:d76a5fe55d4b8b8b879bd5',
    messagingSenderId: '700231469008',
    projectId: 'artifact-engine',
    authDomain: 'artifact-engine.firebaseapp.com',
    storageBucket: 'artifact-engine.firebasestorage.app',
  );
}
