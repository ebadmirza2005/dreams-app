import 'package:flutter/material.dart';
import '../screen/profile_screen.dart';
import 'text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(onPressed: () {
        leading:  PopupMenuButton<String>(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width
          ),
          icon: Icon(Icons.menu),
          onSelected: (value) {
            if (value == "profile") {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
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
          ],

        ),
      // }, icon: Icon(Icons.menu)),
      title: Text("App Name"),
      centerTitle: true,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
