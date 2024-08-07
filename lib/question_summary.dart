import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSuummary extends StatelessWidget {
  const QuestionSuummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrectAnswer =
                  data['correct_answer'] == data['user_answer'];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isCorrectAnswer
                            ? Colors.green
                            : Color.fromARGB(255, 223, 17, 17),
                        borderRadius: BorderRadius.circular(20)),
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: isCorrectAnswer ? Colors.green
                            : Color.fromARGB(255, 223, 17, 17),),),
                        Text(data['correct_answer'] as String,style: TextStyle(color: Colors.green),),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
