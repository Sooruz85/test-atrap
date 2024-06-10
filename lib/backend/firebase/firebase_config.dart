import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAflloHhrED-slVRy9TI9IUJHWbkLOepc0",
            authDomain: "atrap-e2d3b.firebaseapp.com",
            projectId: "atrap-e2d3b",
            storageBucket: "atrap-e2d3b.appspot.com",
            messagingSenderId: "601148374900",
            appId: "1:601148374900:web:61041770a3c75f0a12b621",
            measurementId: "G-FX8CKV9HVY"));
  } else {
    await Firebase.initializeApp();
  }
}
