import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:islemsel_zeka_quiz_project/view/main_view/main_view.dart';
import 'package:provider/provider.dart';

import 'controllers/question_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBKGEqd0rr9UfIThXttGr426Oc9_jUjN_I",
          authDomain: "islemsel-zeka-project.firebaseapp.com",
          projectId: "islemsel-zeka-project",
          storageBucket: "islemsel-zeka-project.appspot.com",
          messagingSenderId: "941512168842",
          appId: "1:941512168842:web:cc2c6392168705513d2473")).then((value) =>
   QuestionController.loadQuestions()
          );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => QuestionController.instance),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainView(),
      initialRoute: MainView.routeName,
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => const MainView()),
      onGenerateRoute: (settings) {
        print(settings.name);
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => const MainView());
        }
        return MaterialPageRoute(builder: (context) => const MainView());
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hello World!'),
    );
  }
}
