import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF263746),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          return Icon(
            index == 1
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: index == 1 ? Colors.orange : Colors.grey,
          );
        }),
      ),
    );
  }
}
