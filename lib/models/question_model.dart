import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<String> options;
  final String answer;
  int selectedOptionIndex;

  Question(
      {required this.question,
      required this.options,
      required this.answer,
      this.selectedOptionIndex = -1});

  bool isCorrect(String option) => option.toLowerCase().trim() == answer.toLowerCase().trim();

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'],
      options: List<String>.from(map['options']),
      answer: map['answer'],
    );
  }

  void selectOption(int index) {
    selectedOptionIndex = index;
    setColor = Colors.orange;
  }

  set setColor(Color color) {
    this.color = color;
  }

  Color? color;
  Color getColor(int optionIndex) {
    return selectedOptionIndex == optionIndex && color != null
        ? color!
        : getCorrectOption == options[optionIndex] && (color == Colors.red || color == Colors.green)
            ? Colors.green
            : Colors.white;
  }

  String get getCorrectOption => options.firstWhere((element) => isCorrect(element));

  void reset() {
    selectedOptionIndex = -1;
    color = null;
  }
}
