import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String lText;
  const TextFieldWidget({super.key, required this.lText});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.7,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: lText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

