import 'package:dreams_app/screen/vehicle_parts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_bar.dart';
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
          title: Align(
              alignment: Alignment.center,
              child: TextWidget(text: "Vehicle Details", textSize: 20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Vehicle No:"),
                      TextWidget(text: "KX-1339"),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Vehicle Type:"),
                      TextWidget(text: "Suzuki"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Vehicle Route"),
                  TextWidget(text: "Nasar Pur, Tando Soomro", textSize: 18,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Driver"),
                      TextWidget(text: "KX-1339", textSize: 18,)
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "CNIC"),
                      TextWidget(text: "Suzuki", textSize: 18,)
                    ],
                  ),
                ],
              ),
            ],
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
       body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff005baa),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextWidget(text: "Van Inspection Form", textSize: 24),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: "Vehicle Details", textSize: 18),
                        OutlinedButton.icon(
                          onPressed: viewDetails,
                          icon: const Icon(Icons.visibility),
                          label: TextWidget(text: "View"),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff005baa)),
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 10),
                    SizedBox(height: 20,),
                    TextWidget(text: "Sections", textSize: 20,),
                    FilledButtonWidget(buttonText: "Section 1: Vehicle Parts", textSize: 20, onTap: () {
                      context.go('/vehicle-parts');
                    },),
                    SizedBox(height: 10,),
                    FilledButtonWidget(buttonText: "Section 2: Documents", textSize: 20, onTap: () {},),
                    SizedBox(height: 10,),
                    FilledButtonWidget(buttonText: "Section 3: Personal Details", textSize: 20, onTap: () {},),
                    SizedBox(height: 20,),
                    TextWidget(text: "Van Image w/ Driver", textSize: 18,),
                    SizedBox(height: 20,),
                    DottedBorder(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color(0xffe6e0e9),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: () {}, label: TextWidget(text: "Upload Image"), icon: Icon(Icons.upload),)
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // TextWidget(text: "----------------------------------- "),
                                Divider(),
                                TextWidget(text: "OR "),
                                Divider()
                                // TextWidget(text: "----------------------------------- "),
                              ],
                            ),
                            SizedBox(height: 15,),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                              onPressed: () {}, label: TextWidget(text: "Open Camera"), icon: Icon(Icons.camera_alt),)

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Divider(),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: FilledButton(
                            onPressed: () {}, child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextWidget(text: "Submit", textSize: 20,),
                            Icon(Icons.send)
                          ],
                        )),
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),

    );
  }
}