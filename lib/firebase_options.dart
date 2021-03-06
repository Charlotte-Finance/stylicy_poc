// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJmiaVnb-j375KzLVNNnVB3zIeO49HXvw',
    appId: '1:1073761063808:android:b306a44da7884293d26765',
    messagingSenderId: '1073761063808',
    projectId: 'stylicypoc',
    databaseURL: 'https://stylicypoc-default-rtdb.firebaseio.com',
    storageBucket: 'stylicypoc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzdbnN6vRth2rNnJlvrqdvazC1tMh0kxk',
    appId: '1:1073761063808:ios:5d03377bc9fb8fb4d26765',
    messagingSenderId: '1073761063808',
    projectId: 'stylicypoc',
    databaseURL: 'https://stylicypoc-default-rtdb.firebaseio.com',
    storageBucket: 'stylicypoc.appspot.com',
    iosClientId: '1073761063808-ea2khdohts716jncj46q3ml6au7n6a04.apps.googleusercontent.com',
    iosBundleId: 'com.example.poc',
  );
}
