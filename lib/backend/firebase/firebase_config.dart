import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzW643lO0RcSkU1-3BYArI3Wse4ftQQyQ",
            authDomain: "atrap-c8027.firebaseapp.com",
            projectId: "atrap-c8027",
            storageBucket: "atrap-c8027.appspot.com",
            messagingSenderId: "190585891393",
            appId: "1:190585891393:web:d628f27fa963eba40774c0",
            measurementId: "G-GXB3M8M7WB"));
  } else {
    await Firebase.initializeApp();
  }
}
