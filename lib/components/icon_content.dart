import 'package:flutter/material.dart';
import 'constants.dart';

class CardChildWidget extends StatelessWidget {
  CardChildWidget({this.myIconData, this.iconLable});

  final IconData myIconData;
  final String iconLable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIconData,
          size: 70.0,
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          iconLable,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}
