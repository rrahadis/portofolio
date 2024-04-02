import 'package:flutter/material.dart';
import 'package:rrahadis_web/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      databaseURL:
          "https://rrahadis-web-default-rtdb.asia-southeast1.firebasedatabase.app",
      authDomain: "rrahadis-web.firebaseapp.com",
      apiKey: "AIzaSyCWAVCz3rai2KVIT0L9d6G6z2wNUXlLO9s",
      appId: "1:589427449592:web:3d446f70d42a7f3909650d",
      messagingSenderId: "589427449592",
      projectId: "rrahadis-web",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rahadi's",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 45, 123, 86),
        scaffoldBackgroundColor: const Color.fromARGB(255, 51, 51, 51),
        dividerColor: Colors.white54,
        colorScheme: ColorScheme.light(primary: Colors.black),
      ),
      home: MainPage(),
    );
  }
}
