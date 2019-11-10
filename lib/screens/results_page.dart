import 'package:bmi_calculator/components/bmi_calculator.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.height, @required this.weight, this.age, this.gender});
  final double height, weight, age;
  final sex gender;

  @override
  Widget build(BuildContext context) {
    BmiCalculator result = BmiCalculator(weight: weight, height: height);
    //  print(result.getDescription());
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'BMI CALCULATOR',
      )),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              cardChild: Text(
                'Your Result',
                style: kNumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  result.getVerdict(),
                  style: kVerdictMessage,
                ),
                Text(
                  result.bmiCalculator(),
                  style: kNumberTextStyle,
                ),
                Text(
                  result.getDescription(),
                  style: kVerdictDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ButtomButton(
            text: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
