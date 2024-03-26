import 'package:flutter/material.dart';
import 'package:rrahadis_web/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
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
