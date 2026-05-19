import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  const TextWidget({super.key, required this.text, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: textSize,
    ),);
  }
}
