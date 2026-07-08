import 'package:flutter/material.dart';

import 'text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(child: TextWidget(text: "A"),),
        SizedBox(width: 10,),
        Column(
          children: [
            TextWidget(text: "Ghulam Shabbir (KX-1339"),
            TextWidget(text: "CNIC: 4220145869879"),
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
        Icon(Icons.arrow_forward)
      ],
    );
  }
}
