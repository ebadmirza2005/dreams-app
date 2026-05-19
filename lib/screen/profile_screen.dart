import 'package:flutter/material.dart';
import '../utils/app_bar.dart';
import '../utils/text.dart';
import '../utils/text_field.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  onPressed: () {}, icon: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff005baa),
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white,))),
            ),
            SizedBox(height: 40,),
            TextWidget(text: "Profile Settings", textSize: 25,),
            Image.asset("assets/img.png"),
            SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFieldWidget(
                lText: "Name",
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFieldWidget(
                lText: "Password",
              ),
            )
          ],
        ),
      floatingActionButton:  SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            }, child: Text("Back to Home")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
