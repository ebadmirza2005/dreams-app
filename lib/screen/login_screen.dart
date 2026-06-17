import 'package:flutter/material.dart';
import '../utils/button.dart';
import '../utils/text.dart';
import '../utils/auth_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login() {
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
               Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     TextFieldWidget(lText: "Email", controller: _emailCtrl,),
                     SizedBox(height: 40,),
                     TextFieldWidget(lText: "Password", controller: _passCtrl,),
                   ],
                 ),
               ),
               SizedBox(height: 20,),
               FilledButton(
                   style: FilledButton.styleFrom(
                       fixedSize: const Size(200, 86)
                   ),
                   onPressed: _login, child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextWidget(text: "Login", textSize: 30,),
                   SizedBox(width: 10,),
                   Icon(Icons.logout, size: 30,)
                 ],
               ))
             ],
           ),
         ),

       ),
    );
  }
}
