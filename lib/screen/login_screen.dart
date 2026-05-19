import 'package:flutter/material.dart';
import '../utils/button.dart';
import '../utils/text.dart';
import '../utils/text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void loginButton() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
       body: SafeArea(
         child: Center(
           child: Column(
             children: [
               SizedBox(height: height * 0.1,),
               Image.asset("assets/FESF.png", width: width * 0.5,),
               SizedBox(height: 20,),
               TextWidget(text: "App Name",),
               SizedBox(height: height * 0.15,),
               TextFieldWidget(lText: "Email",),
               SizedBox(height: 40,),
               TextFieldWidget(lText: "Password",),
               SizedBox(height: 20,),
               ButtonWidget(buttonText: "Login", textSize: 30, buttonIcon: Icon(Icons.login, size: 30,), onTap: loginButton)
             ],
           ),
         ),

       ),
    );
  }
}
