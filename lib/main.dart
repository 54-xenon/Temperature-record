import 'package:flutter/material.dart';
import 'package:temperaurerecordapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "体温トラッカー",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen
        ),
      ),
      home: HomePage(),
    );
  }
}