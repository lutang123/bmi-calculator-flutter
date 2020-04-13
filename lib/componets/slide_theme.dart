import 'package:flutter/material.dart';

class MySliderTheme extends StatelessWidget {
  MySliderTheme(
      {this.value, this.minValue, this.maxValue, this.sliderFunction});
  final double value;
  final double minValue;
  final double maxValue;
  final Function sliderFunction;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: Color(0xFF8D8E98),
        activeTrackColor: Colors.white,
        thumbColor: Color(0xFFEB1555),
        overlayColor: Color(0x29EB1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
      ),
      child: Slider(
        value: value,
//        value: height.toDouble(),
        min: minValue,
        max: maxValue,
        onChanged: sliderFunction,
//        sliderFunction: (double newValue) {
//          setState(() {
//            height = newValue.round();
//          });
//        },
      ),
    );
  }
}
