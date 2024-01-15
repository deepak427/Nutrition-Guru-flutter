import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NutritionistAiPage extends StatelessWidget {
  const NutritionistAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Nutritionist AI"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Title
              Text(
                "Upload an image of the nutrition label of any product, and the nutritionist AI will give health insights about that product.",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              //Logo

              Lottie.asset(
                'assests/camera_animation.json',
                width: 100,
              ),

              //Image upload button

              

              //Description
            ],
          ),
        ),
      ),
    );
  }
}
