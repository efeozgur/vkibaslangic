import 'package:flutter/material.dart';

import 'dosyalar/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'Flutter Hello World',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
