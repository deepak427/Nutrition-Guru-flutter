import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AiResponseLayout extends StatelessWidget {
  final XFile? img;
  final String aiResponse;

  const AiResponseLayout({Key? key, this.img, required this.aiResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // AspectRatio widget with a fixed aspect ratio
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.file(
                File(img!.path),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Text(
              "Nutritionist AI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height: 10),
          // Product name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              aiResponse,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
