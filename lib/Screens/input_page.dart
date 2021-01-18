import 'package:bmi_calculator/components/Button_Bars.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Reusable_Card.dart';
import 'package:bmi_calculator/components/Icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int _height = 160;
  int _age = 20;
  int _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              // Two Gender Cards
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      childCard: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      childCard: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Center(
                          child: Text(
                            _height.toString(),
                            style: kNumberStyle,
                          ),
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0Xff8d8e98),
                          overlayColor: Color(0x1fEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white),
                      child: Slider(
                        value: _height.toDouble(),
                        min: 100.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  /// weight card
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// age card
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///button bottom
            ButtonButtom(
              onPress: () {
                calculatorBrain calc =
                    calculatorBrain(height: _height, weight: _weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      bmiResults: calc.calculatorBMI(),
                      resultText: calc.getResult(),
                      interpirtation: calc.getInfo(),
                    ),
                  ),
                );
              },
              textOnBar: 'CALCULATOR',
            ),
          ],
        ),
      ),
    );
  }
}
