import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  sex selectedSex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedSex == sex.male
                        ? kActiveCardColour
                        : KInactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectedSex = sex.male;
                      });
                    },
                    cardChild: CardChildWidget(
                      myIconData: FontAwesomeIcons.mars,
                      iconLable: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedSex = sex.female;
                      });
                    },
                    colour: selectedSex == sex.female
                        ? kActiveCardColour
                        : KInactiveCardColour,
                    cardChild: new CardChildWidget(
                      myIconData: FontAwesomeIcons.venus,
                      iconLable: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '180',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                      ),
                      Slider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(colour: kActiveCardColour),
                ),
                Expanded(
                  child: new ReusableCard(colour: kActiveCardColour),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
                child: GestureDetector(
              onTap: () {},
              child: Text(
                'CALCULATE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
              ),
            )),
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: KBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
