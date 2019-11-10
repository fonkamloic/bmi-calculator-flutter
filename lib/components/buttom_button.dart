import 'package:flutter/material.dart';

import 'constants.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({
    @required this.height,
    @required this.weight,
    this.age,
    this.gender,
    @required this.onPress,
    @required this.text,
  });
  final sex gender;
  final double height;
  final double weight;
  final double age;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        onTap: onPress,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
      )),
      color: kBottomContainerColour,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: kBottomContainerHeight,
    );
  }
}
