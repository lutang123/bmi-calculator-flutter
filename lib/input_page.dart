import 'package:bmi_calculator/componets/bottom_button.dart';
import 'componets/slide_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'componets/reusable_card.dart';
import 'componets/icon_content.dart';
import 'constants.dart';
import 'componets/round_icon_button.dart';
import 'result.dart';
import 'bmi_calculator.dart';

//we didn't create property in this class, instead,
// we create parameters in the class method. Both ways are ok.
BMICalculator bmiCalculator = BMICalculator();

//this is how we use this class
//String bmi = bmiCalculator.bmiFunction(180, 60);
//bmiCalculator.getResult(); //but this must be inside a function

//Gender is an enum we created, and we set a variable for Gender, starting value is null.
//with enum, we don't need if and else, we use ternary operator
//we evaluate an expression and assign this color to a property.
//it's like putting the two reusableCard together and link them to
// a category, label them as (male and female), in this way,
// when we press one, it changes both

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //inside stateful widget, variables don't have to be final
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

//  //although this is working, it's the best to put calculation and interpretation into separate page.
//  bmiCalculator(height, weight) {
//    double bmi = weight / pow(height / 100, 2);
//    return bmi;
//  }

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
                ReusableCard(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: IconContent(
                    myIcon: FaIcon(FontAwesomeIcons.mars),
                    myText: 'MALE',
                    myOnPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: IconContent(
                    myIcon: FaIcon(FontAwesomeIcons.venus),
                    myText: 'FEMALE',
                    myOnPressed: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            colour: kActiveCardColour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kMyTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kMyTextStyle,
                    )
                  ],
                ),
//                SliderTheme(
//                  data: SliderTheme.of(context).copyWith(
//                    inactiveTrackColor: Color(0xFF8D8E98),
//                    activeTrackColor: Colors.white,
//                    thumbColor: Color(0xFFEB1555),
//                    overlayColor: Color(0x29EB1555),
//                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
//                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
//                  ),
//                  child: Slider(
//                    value: height.toDouble(),
//                    min: 120.0,
//                    max: 220.0,
//                    onChanged: (double newValue) {
//                      setState(() {
//                        height = newValue.round();
//                      });
//                    },
//                  ),
//                ),
                MySliderTheme(
                  value: height.toDouble(),
                  minValue: 120.0,
                  maxValue: 220.0,
                  sliderFunction: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  colour: kActiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kMyTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ReusableCard(
                  colour: kActiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kMyTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: bmiCalculator.bmiFunction(height, weight),
                    bmiResult: bmiCalculator.getResult(),
                    bmiInterpretation: bmiCalculator.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
