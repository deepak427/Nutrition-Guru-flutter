import 'package:flutter/material.dart';

class Question {
  final String title;
  final List<String> options;
  TextEditingController other;
  String selected;

  Question({
    required this.title,
    required this.options,
    required this.selected,
    required this.other,
  });
}
