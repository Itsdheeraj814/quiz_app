import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_sig2/data/questions.dart';
import 'package:project_sig2/questions_screen.dart';
import 'package:project_sig2/result_screen.dart';
import 'package:project_sig2/start_screen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _QuizState();
}

class _QuizState extends State<quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  

  void restartQuiz(){
    setState(() {
      selectedAnswers =[];
      activeScreen = 'question-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  //stores the answer here by adding the answers in the list(the chooseAnswer does this)
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        
        activeScreen ='result-screen';
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen((switchScreen));

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if(activeScreen == 'result-screen'){
      screenWidget =  ResultScreen(chosenAnswers: selectedAnswers,restart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.white, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
