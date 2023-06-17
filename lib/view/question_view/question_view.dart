import 'package:flutter/material.dart';
import 'package:islemsel_zeka_quiz_project/core/extensions/widget_extensions.dart';
import 'package:islemsel_zeka_quiz_project/view/question_view/question_widget.dart';
import 'package:provider/provider.dart';

import '../../controllers/question_controller.dart';
import '../../models/question_model.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<QuestionController>(
        builder: (context, controller, _) {
          return PageView.builder(
              controller: controller.scrollController,
              itemCount: controller.questions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Question question = controller.questions[index];
                return QuestionPage(
                  question: question,
                  currentQuestion: index,
                  totalQuestions: controller.questions.length,
                  onOptionSelected: (int optionIndex) => controller.onOptionSelected(optionIndex, context),
                  onNextPressed: (_) => controller.nextPage(context),
                  onPreviousPressed: (_) => controller.prevPage(),
                );
              }).loading(controller.questions.isNotEmpty);
        },
      ),
    );
  }
}
