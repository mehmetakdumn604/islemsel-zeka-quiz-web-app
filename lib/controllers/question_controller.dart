import 'package:flutter/material.dart';
import 'package:islemsel_zeka_quiz_project/core/extensions/navigate_extensions.dart';
import 'package:islemsel_zeka_quiz_project/services/firestore_service.dart';

import '../models/question_model.dart';
import '../view/main_view/main_view.dart';

class QuestionController extends ChangeNotifier {
  static final QuestionController _instance = QuestionController._internal();
  static QuestionController get instance => _instance;
  QuestionController._internal();

  static loadQuestions() async {
    await _instance._loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final List data = await DataService.instance.getQuestions();

    _questions = List<Question>.from(data.map((question) => Question.fromMap(question)));
    _questions.shuffle();
    notifyListeners();
  }

  List<Question> _questions = [];

  List<Question> get questions => _questions;

  PageController scrollController = PageController();

  onOptionSelected(int index, BuildContext context) {
    if (_isSelectedOption) return;
    _isSelectedOption = true;
    Question question = _questions[scrollController.page?.toInt() ?? 0];
    _questions[scrollController.page?.toInt() ?? 0].selectOption(index);
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      question.setColor = getCorrectColor(_questions[scrollController.page?.toInt() ?? 0].options[index]) ?? Colors.white;
      if (question.isCorrect(question.options[index])) {
        _incrementCorrectAnswer();
      }
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () {
        _isSelectedOption = false;
        nextPage(context);
        question.color = null;
        notifyListeners();
      });
    });
  }

  bool _isSelectedOption = false;

  prevPage() {
    if (_isSelectedOption) return;

    scrollController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  nextPage(BuildContext context) {
    if (_isSelectedOption) return;
    scrollController.page?.toInt() == _questions.length - 1
        ? showCompleteDialog(context)
        : scrollController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  Color? getCorrectColor(String option) {
    if (_questions[scrollController.page?.toInt() ?? 0].isCorrect(option)) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  void showCompleteDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(
                "Tebrikler!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              content: Text(
                """${_questions.length} sorudan $correctAnswer soruya doğru cevap verdiniz.
Puanınız: $getScore
Başarı Durumunuz: $getSuccessStatus""",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.navigateToRemove(const MainView());
                      reset();
                    },
                    child: const Text("Tekrar Dene")),
                TextButton(
                    onPressed: () {
                      context.navigateToRemove(const MainView());
                      reset();
                    },
                    child: const Text("KAPAT")),
              ],
            ));
  }

  String get getScore => "${((correctAnswer / _questions.length) * 100).toStringAsFixed(1)} %";
  int get getPoint => int.tryParse(getScore.split(".").first) ?? 0;
  String get getSuccessStatus => getPoint == 100
      ? "MÜKEMMEL"
      : getPoint >= 70
          ? "BAŞARILI"
          : "BAŞARISIZ";

  int correctAnswer = 0;

  void _incrementCorrectAnswer() {
    correctAnswer++;
  }

  reset() {
    for (var question in _questions) {
      question.reset();
    }
    scrollController.jumpToPage(0);
    correctAnswer = 0;

    notifyListeners();
  }
}
