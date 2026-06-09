import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String lText;
  final RegExp? regex;
  final TextEditingController? controller;
  const TextFieldWidget({super.key, required this.lText, this.controller, this.regex});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.7,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "$lText is required";
          if (regex != null && !regex!.hasMatch(value)) {
            return "Enter a valid ${lText}";
          }

          return null;
        },
      ),
    );
  }
}

