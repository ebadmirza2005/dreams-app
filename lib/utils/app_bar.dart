import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screen/login_screen.dart';
import 'text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading:  PopupMenuButton<String>(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width
          ),
          icon: Icon(Icons.menu),
          onSelected: (value) {
            if(value == "home") {
              context.go('/home');
            } else if (value == "profile") {
              context.go('/profile');
            }else if(value == "logout") {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            }

          },
          itemBuilder: (context) => [
            PopupMenuItem<String>(
              value: "home",
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10,),
                  TextWidget(text: "Home",),
                ],
              )
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
                value: "profile",
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    TextWidget(text: "Profile",),
                  ],
                )
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
                value: "logout",
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10,),
                    TextWidget(text: "Logout",),
                  ],
                )
            ),
          ],

        ),
      // }, icon: Icon(Icons.menu)),
      title: Text("Dreams Operations"),
      centerTitle: true,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
