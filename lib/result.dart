//import 'dart:ui'; //what's this?
import 'package:flutter/material.dart';
import 'package:bmi_calculator/componets/reusable_card.dart';
import 'package:bmi_calculator/componets/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'bmi_calculator.dart';

BMICalculator bmiCalculator = BMICalculator();

class Result extends StatelessWidget {
  //in order to get data from first page, we created property and constructor for this class
  //the name of the variable can be anything
  //this is the property, not a variable we use in this class,
  //we do not make property private
  Result(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.bmiInterpretation});
  final String bmi;
  final String bmiResult;
  final String bmiInterpretation;

//  //although this is working, it's the best to put calculation and interpretation into separate page.
//  String getResult() {
//    if (_bmi >= 25) {
//      return 'Overweight';
//    } else if (_bmi > 18.5) {
//      return 'Normal';
//    } else {
//      return 'Underweight';
//    }
//  }
//
//  String getInterpretation() {
//    if (_bmi >= 25) {
//      return 'You have a higher than normal body weight. Try to exercise more.';
//    } else if (_bmi >= 18.5) {
//      return 'You have a normal body weight. Good job!';
//    } else {
//      return 'You have a lower than normal body weight. You can eat a bit more.';
//    }
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          //default will go up to the top
          //if it's row, default go to the very left
          //we can wrap text into a container to position it to the left
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          ReusableCard(
            colour: kActiveCardColour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  // we can not use this function in bmiCalculator,
                  //because this if else function depends on the value of bmi,
                  //which we don't have here unless we write a new function in this class
                  //bmiCalculator.getResult(),,
                  bmiResult,
                  style: kResultTextStyle,
                ),
                Text(
                  //this is a property with a constructor, we get the value from input-page
                  bmi,
                  style: kBMITextStyle,
                ),
                Text(
                  bmiInterpretation,
                  style: kBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
