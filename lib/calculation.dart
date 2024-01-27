import 'dart:math';

class calculations {
  calculations(this.heigh, this.wedith) : _Bmi = 0.0;
  num heigh;
  num wedith;
  double _Bmi;

  double calculate() {
    _Bmi = wedith / pow(heigh / 100, 2);
    return double.parse(
        _Bmi.toStringAsFixed(2)); // Don't need to parse and round here
  }

  double getbmi() {
    calculate(); // Call calculate method to update _Bmi
    print(_Bmi); // Check the value
    return _Bmi;
  }

  String textweight() {
    if (_Bmi >= 25) {
      return "overweight";
    } else if (_Bmi <= 18) {
      return "underweight";
    } else {
      return "normal";
    }
  }

  String longtext() {
    if (_Bmi >= 25) {
      return "you have higher than normal body weight, try to exercise more";
    } else if (_Bmi <= 18) {
      return "you have lower than normal body weight, try to eat more";
    } else {
      return "you have normal than normal body weight, try to maintain";
    }
  }
}
