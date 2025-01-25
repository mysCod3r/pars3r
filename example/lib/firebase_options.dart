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
    apiKey: 'AIzaSyCojHNkRq5RMqrFKZE61O1-KpM1AoXMmow',
    appId: '1:283807744839:web:2dcd30491a661135ce8262',
    messagingSenderId: '283807744839',
    projectId: 'advanced-remote-config-project',
    authDomain: 'advanced-remote-config-project.firebaseapp.com',
    storageBucket: 'advanced-remote-config-project.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvj78utxqR35T5BHXRIbsqn0-VixM8pUM',
    appId: '1:283807744839:android:2bb956b9d698f194ce8262',
    messagingSenderId: '283807744839',
    projectId: 'advanced-remote-config-project',
    storageBucket: 'advanced-remote-config-project.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk4v1Fins6zX_3GMdzR_fLJoBcr-e-VZA',
    appId: '1:283807744839:ios:2f0f6d6ece28c805ce8262',
    messagingSenderId: '283807744839',
    projectId: 'advanced-remote-config-project',
    storageBucket: 'advanced-remote-config-project.firebasestorage.app',
    iosBundleId: 'com.example.firebaseRemoteConfigExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBk4v1Fins6zX_3GMdzR_fLJoBcr-e-VZA',
    appId: '1:283807744839:ios:2f0f6d6ece28c805ce8262',
    messagingSenderId: '283807744839',
    projectId: 'advanced-remote-config-project',
    storageBucket: 'advanced-remote-config-project.firebasestorage.app',
    iosBundleId: 'com.example.firebaseRemoteConfigExample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCojHNkRq5RMqrFKZE61O1-KpM1AoXMmow',
    appId: '1:283807744839:web:3cd8fd198aff9e0fce8262',
    messagingSenderId: '283807744839',
    projectId: 'advanced-remote-config-project',
    authDomain: 'advanced-remote-config-project.firebaseapp.com',
    storageBucket: 'advanced-remote-config-project.firebasestorage.app',
  );
}
