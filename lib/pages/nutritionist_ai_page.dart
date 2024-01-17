import 'package:flutter/material.dart';
import 'package:nutrition_guru/api/gpt_vision_api.dart';
import 'package:nutrition_guru/pages/ai_page.dart';

class NutritionistAiPage extends StatelessWidget {
  const NutritionistAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AiPage(
      apiCall: makeGptVisionApiRequest,
      instructions:
          "Upload an image of the nutrition label of any product, and the nutritionist AI will give health insights about that product.",
      systemMessage:
          'You are a nutritionist. You have knowledge of the effects of nutrients and ingredients in a product on health. You will be given an image of the nutritional information label. Output the benefits and losses of consuming that product. Also recommend how much of that product should be consumed per day.',
      cameraPath: 'assests/camera_animation.json', header: 'Nutritionist AI',
    );
  }
}
