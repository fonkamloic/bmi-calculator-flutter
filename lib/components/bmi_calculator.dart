import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'constants.dart';

class BmiCalculator {
  BmiCalculator(
      {@required this.height, this.age, @required this.weight, this.gender});
  final double height, age, weight;
  double _bmi = 0, _bmi_d = 0;
  final sex gender;

  String bmiCalculator() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  double bmiCalculatorDouble() {
    _bmi_d = weight / pow((height / 100), 2);
    return _bmi_d;
  }

  String getVerdict() {
    if (bmiCalculatorDouble() > 25) {
      return 'Overweight';
    } else if (_bmi_d > 18.5 && _bmi_d <= 25) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String getDescription() {
    if (bmiCalculatorDouble() > 25) {
      return 'You have a higher than body weight. Try to exercise more.';
    } else if (_bmi_d > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else
      return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
