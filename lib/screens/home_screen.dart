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
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FullWidthButton(buttonText: "Van Inspection", onTap: vanInspectionButton,),
              SizedBox(height: 10,),
              FullWidthButton(buttonText: "Coming Soon", onTap: () {},),
              SizedBox(height: 10,),
              FullWidthButton(buttonText: "Coming Soon", onTap: () {},),
              SizedBox(height: 10,),
              FullWidthButton(buttonText: "Coming Soon", onTap: () {},),
            ],
          ),
          )
        ],
      ),
    );
  }
}
