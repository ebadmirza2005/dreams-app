import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/button.dart';
import '../utils/text.dart';
import 'package:dotted_border/dotted_border.dart';

class VanInspectionForm extends StatefulWidget {
  const VanInspectionForm({super.key});

  @override
  State<VanInspectionForm> createState() => _VanInspectionFormState();
}

class _VanInspectionFormState extends State<VanInspectionForm> {
  Future<void> viewDetails() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Align(
              alignment: Alignment.center,
              child: TextWidget(text: "Vehicle Details", textSize: 20)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Vehicle No:"),
                          TextWidget(text: "KX-1339"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Vehicle Type:"),
                          TextWidget(text: "Suzuki"),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Vehicle Route"),
                    TextWidget(text: "Nasar Pur, Tando Soomro", textSize: 16,)
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Driver"),
                          TextWidget(text: "KX-1339", textSize: 16,)
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "CNIC"),
                          TextWidget(text: "Suzuki", textSize: 16,)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: TextWidget(text: "Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double spacing = constraints.maxHeight * 0.012;

            return SingleChildScrollView(
              child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                            onPressed: () => context.go('/review'), icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff005baa),
                            ),
                            child: Icon(Icons.arrow_back, color: Colors.white,))),
                      ),
                      SizedBox(height: spacing),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                              Center(
                                child: TextWidget(text: "Van Inspection Form", textSize: 20),
                              ),
                            SizedBox(height: spacing),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text: "Vehicle Details", textSize: 16),
                                OutlinedButton.icon(
                                  onPressed: viewDetails,
                                  icon: const Icon(Icons.visibility, size: 16),
                                  label: TextWidget(text: "View", textSize: 14),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    side: const BorderSide(color: Color(0xff005baa)),
                                  ),
                                ),
                              ],
                            ),
              
                            SizedBox(height: spacing),
              
                            TextWidget(text: "Sections", textSize: 16),
                            const SizedBox(height: 4),
                            FullWidthButton(buttonText: "Section 1: Vehicle Parts", buttonIcon: Icons.arrow_forward, onTap: () => context.go('/vehicle-parts'),),
                            const SizedBox(height: 6),
                            FullWidthButton(buttonText: "Section 2: Documents", buttonIcon: Icons.arrow_forward, onTap: () => context.go('/documents')),
                            const SizedBox(height: 6),
                            FullWidthButton(buttonText: "Section 3: Personal Details", buttonIcon: Icons.arrow_forward, onTap: () => context.go('/personal-details')),
              
                            SizedBox(height: spacing),
              
                            TextWidget(text: "Van Image w/ Driver", textSize: 16),
                            const SizedBox(height: 4),
              
                            DottedBorder(
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xffe6e0e9),
                                ),
                                child: LayoutBuilder(
                                    builder: (context, boxConstraints) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8)
                                                )
                                            ),
                                            onPressed: () {},
                                            label: TextWidget(text: "Upload Image", textSize: 13),
                                            icon: const Icon(Icons.upload, size: 16),
                                          ),
                                        ],
                                      );
                                    }
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            const Divider(height: 1),
                            const SizedBox(height: 25),
                            DefaultButton(buttonText: "Submit", buttonIcon: Icons.send, onTap: () {},),
                          ],
                        ),
                      )
                    ],
                  ),
            );
          },
        ),
      ),
    );
  }
}