import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/buttom_button.dart';
import 'constants.dart';
import 'components/icon_content.dart';
import 'results_page.dart';
import 'components/reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  sex selectedSex;
  double height = 120;
  double age = 20;
  double weight = 75;

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
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedSex == sex.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
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
                        : kInactiveCardColour,
                    cardChild: CardChildWidget(
                      myIconData: FontAwesomeIcons.venus,
                      iconLable: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toInt().toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xff8d8e98),
                      activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height,
                      min: 100,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toInt().toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              change: () {
                                setState(() {
                                  if (weight < 300) weight++;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              change: () {
                                setState(() {
                                  if (weight > 80) weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toInt().toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              change: () {
                                setState(() {
                                  if (age < 150) age++;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              change: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            text: 'CALCULATE',
            height: height,
            weight: weight,
            age: age,
            gender: selectedSex,
            onPress: () {
              if (selectedSex != sex.female && selectedSex != sex.male) {
                Alert(
                        context: context,
                        title: "Gender?",
                        desc: "Select a gender for an accurate result!")
                    .show();
                return;
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          gender: selectedSex,
                          height: height,
                          weight: weight,
                          age: age)));
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.change});

  final IconData icon;
  final Function change;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: change,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
