import 'package:flutter/material.dart';

const TextStyle lableTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xff8d8e98),
);

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
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconLable,
          style: lableTextStyle,
        ),
      ],
    );
  }
}
