import 'package:dreams_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'text.dart';

class VehiclePartsDetails extends StatelessWidget {
  final int index;
  const VehiclePartsDetails({super.key, required this.index});

  void _showRemarksDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            TextWidget(text: "Remarks", textSize: 20,),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: null,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Enter Your Remarks Here...", hintStyle: TextStyle(
                    fontSize: 14
                  ) ,
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: DefaultButton(buttonText: "Cancel", onTap: () => Navigator.of(context).pop(),)),
                SizedBox(width: 5,),
                Expanded(child: DefaultButton(buttonText: "Enter", onTap: () {},)),
              ],
            )


          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextWidget(
            text: "${index}: Headlights (Bright & Dim)",
            textSize: 15,
          ),
        ),

        const SizedBox(width: 2),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildResponsiveButton("Yes"),
            _buildResponsiveButton("No"),
            IconButton(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(4),
              icon: const Icon(
                Icons.comment_outlined,
                color: Color(0xff005baa),
                size: 22,
              ),
              onPressed: () {
                _showRemarksDialog(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResponsiveButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1),
        shape: BoxShape.circle,
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
