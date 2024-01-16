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
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.file(
              File(img!.path),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 25),
          // Product name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              aiResponse,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
