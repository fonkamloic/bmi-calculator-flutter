import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const activeCardColour = Color(0xff1d1e33);
const bottomContainerHeight = 50.0;
const inactiveCardColour = Color(0xff111328);
const bottomContainerColour = Color(0xffeb1555);

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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedSex == sex.male
                        ? activeCardColour
                        : inactiveCardColour,
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
                        ? activeCardColour
                        : inactiveCardColour,
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
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(colour: activeCardColour),
                ),
                Expanded(
                  child: new ReusableCard(colour: activeCardColour),
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
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
