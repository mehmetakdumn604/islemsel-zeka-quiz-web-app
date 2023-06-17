import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/question_controller.dart';
import '../../../models/question_model.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.onOptionSelected,
    required this.question,
    required this.index,
  });

  final Function onOptionSelected;
  final Question question;

  final int index;

  @override
  Widget build(BuildContext context) {
    final String option = question.options[index];
    return GestureDetector(
      onTap: () {
        onOptionSelected(index);
      },
      child: Consumer<QuestionController>(builder: (BuildContext context, QuestionController controller, _) {
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
