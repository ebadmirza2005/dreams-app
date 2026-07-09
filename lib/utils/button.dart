import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'text.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonTextColor;
  final IconData? buttonIcon;
  final VoidCallback? onTap;

  const DefaultButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.buttonIcon,
    this.buttonTextColor
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
          Text(
            buttonText, style: TextStyle(
            fontSize: 18,
            color: buttonTextColor,
          ),
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

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const IconButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: onTap,
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff005baa),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}




