import 'package:bmi_calculator_flutter/input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          backgroundColor: Colors.black,
        ),
      ),
      home: Input_file(),
    );
  }
}
