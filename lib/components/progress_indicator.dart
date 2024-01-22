import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final int totalQuestions;
  final int currentQuestion;
  const MyProgressIndicator(
      {super.key, required this.totalQuestions, required this.currentQuestion});

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
            index == currentQuestion
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: index == currentQuestion ? Colors.orange : Colors.grey,
          );
        }),
      ),
    );
  }
}
