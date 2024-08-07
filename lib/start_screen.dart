import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
   StartScreen(this.StartQuiz,{super.key});

  void Function() StartQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
           Text(
            'Lets Go To Flutter Quiz',
            style: GoogleFonts.lato(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: StartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(221, 47, 44, 44),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            label:  Text(
              'Start Quiz',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
