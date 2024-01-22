import 'package:flutter/material.dart';
import 'package:nutrition_guru/models/question.dart';

class MyProgressIndicator extends StatelessWidget {
  final int totalQuestions;
  final int currentQuestion;
  final List<Question> questionsList;
  const MyProgressIndicator(
      {super.key,
      required this.totalQuestions,
      required this.currentQuestion,
      required this.questionsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF263746),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalQuestions, (index) {
          return Icon(
            questionsList[index].selected != " "
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: currentQuestion == index
                ? Colors.purple
                : questionsList[index].selected != " "
                    ? Colors.orange
                    : Colors.grey,
          );
        }),
      ),
    );
  }
}
