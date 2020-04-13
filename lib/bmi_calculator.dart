import 'dart:math';

class BMICalculator {
  //do we have to change it into a private variable?
  //yes, otherwise in other page you can change using bmiCalculator.bmi,
  //this is a variable we use to write function in this class,
  //this is also a property but without constructor, we calculate the value
  //this is why we make it private.
  double _bmi;

  String bmiFunction(height, weight) {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
