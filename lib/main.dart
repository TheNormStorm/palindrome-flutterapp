import 'package:flutter/material.dart';

import 'formpage.dart';

void main() => runApp(MyApp());
final ThemeData _themeData = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.amber,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome Test',
      theme: _themeData,
      home: FormScreen(),
    );
  }
}
