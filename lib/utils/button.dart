import 'package:flutter/material.dart';

import '../screen/home_screen.dart';
import 'text.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final double textSize;
  final Icon? buttonIcon;
  final VoidCallback? onTap;
  const ButtonWidget({super.key, required this.buttonText, this.buttonIcon, required this.textSize, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FilledButton.icon(
        icon: buttonIcon,
        style: FilledButton.styleFrom(
          fixedSize: const Size(200, 86)
        ),
        onPressed: onTap,
        label: Text(buttonText, style: TextStyle(
          fontSize: textSize,
        ),),
      ),
    );
  }
}

class FilledButtonWidget extends StatelessWidget {
  final String buttonText;
  final double? textSize;
  const FilledButtonWidget({super.key, required this.buttonText, this.textSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: FilledButton(
          style: FilledButton.styleFrom(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5)
            // )
          ),
          onPressed: () {}, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: buttonText, textSize: textSize,),
          Icon(Icons.arrow_forward, size: 25,)
        ],
      )),
    );
  }
}

