import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff011222),
        accentColor: Color(0xff1D1F33),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      home: InputPage(),
    );
  }
}
