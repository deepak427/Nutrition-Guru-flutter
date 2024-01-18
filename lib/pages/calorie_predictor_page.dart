import 'package:flutter/material.dart';
import 'package:nutrition_guru/api/gpt_vision_api.dart';
import 'package:nutrition_guru/pages/ai_page.dart';

class CalorieAiPage extends StatelessWidget {
  const CalorieAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AiPage(
      apiCall: makeGptVisionApiRequest,
      instructions:
          "Upload the image of the food you want to predict calories for, and Calorie Predictor will give you the total calories and nutrition in that food.",
      systemMessage:
          'Your work is to predict approximate calories and nutrition in a given image of food. In the given image of a food, predict its approximate total amount of calories, its distribution, and the nutrition in grams of that food. Tell about its effects on health.',
      cameraPath: 'assests/camera_2_animation.json',
      header: 'Calorie Predictor',
    );
  }
}
