// File generated manually for my-biodata-app
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUDzt_brKA4ZKRmMv9-v2fJ16Yxu5ALUg',
    appId: '1:720430780429:web:0170968a55a92533174544',
    messagingSenderId: '720430780429',
    projectId: 'my-biodata-app',
    authDomain: 'my-biodata-app.firebaseapp.com',
    storageBucket: 'my-biodata-app.firebasestorage.app',
  );
}
