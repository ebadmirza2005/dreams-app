import 'package:dreams_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void vanInspectionButton() {
    context.go('/van-inspection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextWidget(text: "Zubair Ahmed", textSize: 18,),
                    SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: TextWidget(text: "Campus: Johar Main Campus", textSize: 16,)),
                        TextWidget(text: "No. of Vans:  25", textSize: 16,),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextWidget(text: "Version 1.0.1", textSize: 10.0,),),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ButtonWidget(buttonText: "Van Inspection", textSize: 17, onTap: vanInspectionButton,),),
                  SizedBox(width: 9,),
                  Expanded(child: ButtonWidget(buttonText: "Coming Soon", textSize: 17, onTap: () {},),),
                  SizedBox(height: 9,),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: ButtonWidget(buttonText: "Coming Soon", textSize: 17, onTap: () {},),),
                  SizedBox(width: 9,),
                  Expanded(child: ButtonWidget(buttonText: "Coming Soon", textSize: 17, onTap: () {},),),
                  SizedBox(height: 9,),
                ],
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}
