import 'package:flutter/material.dart';

BoxDecoration getCustomBoxDecoration(bool isSelected) {
  return isSelected
      ? const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.orange, width: 0.7),
            left: BorderSide(color: Colors.orange, width: 0.7),
            right: BorderSide(color: Colors.orange, width: 0.7),
            bottom: BorderSide(
                color: Colors.orange,
                width: 2.1), // Different width at the bottom
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0), // Border radius
          ),
        )
      : const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.7),
            left: BorderSide(color: Colors.grey, width: 0.7),
            right: BorderSide(color: Colors.grey, width: 0.7),
            bottom: BorderSide(
                color: Colors.grey,
                width: 2.1), // Different width at the bottom
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0), // Border radius
          ),
        ); // Return an empty BoxDecoration if not selected
}
