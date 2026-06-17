import 'package:flutter/material.dart';

import '../utils/app_bar.dart';
import '../utils/button.dart';
import '../utils/text.dart';
import 'van_inspection_form.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  void _startInspection() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => VanInspectionForm()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(), icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff005baa),
                ),
                child: Icon(Icons.arrow_back, color: Colors.white,))),
          ),
          TextWidget(text: "Vehicle Summary", textSize: 24,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Date",),
                        TextWidget(text: "13 May 2026", textSize: 18,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Column(
                          children: [
                            TextWidget(text: "Vehicle No,"),
                            TextWidget(text: "KX-1339", textSize: 18)
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "Vehicle Type"),
                            TextWidget(text: "Suzuki", textSize: 18)
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
                        SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
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
              ),
            ),
          ),
          SizedBox(height: 20,),
          ButtonWidget(buttonText: "Start Inspection", textSize: 18, buttonIcon: Icon(Icons.arrow_forward, size: 20,), onTap: _startInspection,)
        ],
      ),
    );
  }
}
