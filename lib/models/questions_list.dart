import 'package:flutter/material.dart';
import 'package:nutrition_guru/models/question.dart';

class QuestionList extends ChangeNotifier {
  //p questions
  final List<Question> _questionsList = [
    //question 1
    Question(
        title: "Weight",
        options: ["30-50 kg", "50-70 kg", "70-100 kg"],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Age",
        options: ["15-25", "25-45", "45-80"],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Gender",
        options: ["Male", "Female", "Prefer not to say"],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Indivisual goal",
        options: ["Muscle gain", "Fat loss", "Weight gain"],
        selected: ' ',
        other: TextEditingController()),
    //question 2
    Question(
        title: "Activity level",
        options: ["Regular gym", "Athlete", "No activity"],
        selected: ' ',
        other: TextEditingController()),
    // question 3
    Question(
        title: "Health condition",
        options: [
          "Never got seriously sick",
          "Currently sick",
          "Recoverd from sickness"
        ],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Restrictions",
        options: ["Hostler", "Fixed food routine", "Can take mean only 3 time"],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Location",
        options: ["Hilly", "City", "Town"],
        selected: ' ',
        other: TextEditingController()),
    Question(
        title: "Location specific foods",
        options: ["Indian food", "Too much non-veg", "Full veg"],
        selected: ' ',
        other: TextEditingController()),
  ];

  List<Question> get questionsList => _questionsList;

  void changeSelected(String selected, int index) {
    _questionsList[index].selected = selected;
    notifyListeners();
  }
}
