import 'package:dreams_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/text.dart';
import '../utils/auth_field.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            IconButtonWidget(onTap: () => context.go('/'),),
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
        child: DefaultButton(buttonText: "Back to Home", onTap: () => context.go("/"),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
