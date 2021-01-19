import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/Reusable_Card.dart';
import 'package:bmi_calculator/components/Button_Bars.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmiResults,
      @required this.interpirtation,
      @required this.resultText});

  final String bmiResults;
  final String resultText;
  final String interpirtation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// your result
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// info
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResults.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 60.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                  Text(
                    interpirtation.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// button re-calcolate
          ButtonButtom(
            textOnBar: 'RECALCULATOR',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
