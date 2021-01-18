import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonButtom extends StatelessWidget {
  ButtonButtom({this.textOnBar, this.onPress});

  final String textOnBar;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            textOnBar,
            style: TextStyle(
              fontSize: 50.0,
              color: kInActiveCardColor,
            ),
          ),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: kColorOfBottomContainer,
          boxShadow: [kButtonBoxShadow],
        ),
      ),
    );
  }
}
