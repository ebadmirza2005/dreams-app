import 'package:flutter/material.dart';

import '../utils/app_bar.dart';
import '../utils/text.dart';

class VanInspectionForm extends StatefulWidget {
  const VanInspectionForm({super.key});

  @override
  State<VanInspectionForm> createState() => _VanInspectionFormState();
}

class _VanInspectionFormState extends State<VanInspectionForm> {
  double _currentHeight = 0;
  final double _expandedHeight = 200;

  bool _isExpanded = false;

  void _expandOnChanged() {
    var isExpanded = _currentHeight == _expandedHeight;
    setState(() {
      _currentHeight = isExpanded ? 0 : _expandedHeight;
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {},
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
            TextWidget(text: "Van Inspection Form", textSize: 24),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Vehicle Details"),
                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: _expandOnChanged,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xffe6e0e9),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: Radius.circular(_currentHeight == 0 ? 12 : 0),
                          bottomRight: Radius.circular(_currentHeight == 0 ? 12 : 0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        bottom: 10,
                        right: 5,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Vehicle No:"),
                                  TextWidget(text: "KX-1339", textSize: 18)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.35,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Vehicle Type:"),
                                  TextWidget(text: "Suzuki", textSize: 18)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 110.0,
                              child: OutlinedButton(onPressed: () {}, child: Row(
                                    children: [
                                      Icon(Icons.visibility),
                                      SizedBox(width: 10,),
                                      TextWidget(text: "View"),


                                    ],
                                  )),
                            ),
                          )

                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}