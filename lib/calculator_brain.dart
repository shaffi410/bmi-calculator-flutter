import 'dart:math';

class calculatorBrain {
  calculatorBrain({this.height, this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calculatorBMI() {
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

  String getInfo() {
    if (_bmi >= 25) {
      return 'You Should exercise more!';
    } else if (_bmi > 18.5) {
      return 'Perfect! keep up the good work! ';
    } else {
      return 'You should eat more or check your Metabolism';
    }
  }
}
