import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/normal_weight.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/obese_weight.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/over_weight.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/under_weight.dart';

class Calculation {
  Calculation({required this.height, required this.weight});
  int height;
  int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
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
      return 'You have a higher than normal body weight. Try exercising more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. you can eat a bit more.';
    }
  }

  void setBMI(double bmi) {
    _bmi = bmi;
  }

  Color getButtonColor() {
    if (_bmi < 18.5) {
      return Colors.orange;
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return Colors.green;
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  String getButtonText() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal Weight';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Widget getNextPage() {
    if (_bmi < 18.5) {
      return const UnderweightPage();
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return const NormalWeightPage();
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return const OverweightPage();
    } else {
      return const ObesePage();
    }
  }
}
