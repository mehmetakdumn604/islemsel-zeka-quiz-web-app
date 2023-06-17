
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/question_controller.dart';
import '../../models/question_model.dart';
import '../../shared/widgets/custom_button.dart';

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
        title: Text('Question ${currentQuestion + 1} of $totalQuestions'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: MediaQuery.of(context).size.height * 0.3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff6750A4),
                  ),
                  child: Center(
                    child: Text(
                      question.question,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              ...List.generate(question.options.length, (index) {
                String option = question.options[index];

                return GestureDetector(
                  onTap: () {
                    onOptionSelected(index);
                  },
                  child: Consumer<QuestionController>(
                      builder: (BuildContext context, QuestionController controller, _) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: question.getColor(index),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Text(_optionNames[index]),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                option,
                                maxLines: 2,
                                style:
                                    Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Previous',
                    color: Colors.orange.shade700,
                    onPressed: () => onPreviousPressed(),
                  ),
                  CustomButton(
                    text: 'Next',
                    color: Colors.orange.shade700,
                    onPressed: () => onNextPressed(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List _optionNames = ["A", "B", "C", "D", "E"];
List<Color> coolColors = [
  Colors.limeAccent,
  Colors.cyanAccent,
  Colors.pinkAccent,
  Colors.amberAccent,
  Colors.purpleAccent,
];
