import 'package:flutter/material.dart';
import 'package:islemsel_zeka_quiz_project/core/extensions/navigate_extensions.dart';

import '../../shared/widgets/custom_button.dart';
import '../about/about_us_view.dart';
import '../question_view/question_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static String routeName = "/mainview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                
                context.navigateTo(const QuestionView());
              },
              height: 100,
              color: Colors.blue,
              text: "Quize Başla",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () => context.navigateTo(const AboutUsView()),
              height: 100,
              color: Colors.blue,
              text: "HAKKINDA",
            ),
          ],
        ),
      ),
    );
  }
}
