import 'package:flutter/material.dart';
import 'text.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;

  const DefaultButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: buttonText,
            textSize: 18,
          ),
          if (buttonIcon != null) ...[
            const SizedBox(width: 10),
            Icon(buttonIcon, size: 25,),
          ],
        ],
      ),
    );
  }
}

class FullWidthButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;
  const FullWidthButton({super.key, required this.buttonText, this.buttonIcon, this.onTap });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: buttonText,
                textSize: 18,
              ),
              if (buttonIcon != null) ...[
                const SizedBox(width: 10),
                Icon(buttonIcon, size: 25,),
              ],
            ],
          ),
        ),
      ),
    );
  }
}



