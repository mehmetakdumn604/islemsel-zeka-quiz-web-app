import 'package:flutter/material.dart';

import '../../models/question_model.dart';
import 'components/option_card.dart';
import 'components/question_card.dart';

class QuestionPage extends StatelessWidget {
  final Question question;

  final int currentQuestion;
  final int totalQuestions;
  final Function onOptionSelected, onPreviousPressed, onNextPressed;

  const QuestionPage({
    super.key,
    required this.question,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.onOptionSelected,
    required this.onPreviousPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: currentQuestion != 0 ? false : true,
        backgroundColor: Colors.purple.shade200,
        title: Text('Soru ${currentQuestion + 1} / $totalQuestions'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionCard(question: question),
              // can used to be ListView.builder but there aren't many options so I used List.generate
              ...List.generate(question.options.length, (index) {
                return OptionCard(
                  onOptionSelected: onOptionSelected,
                  question: question,
                  index: index,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
