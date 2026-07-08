import 'package:dreams_app/utils/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/text.dart';
import '../utils/user_info.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({super.key});

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  final SearchController searchController = SearchController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {
                  context.go('/van-inspection');
                },
                icon: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff005baa),
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            TextWidget(text: "Van Inspection - Drafts", textSize: 18,),
            SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextWidget(text: "Drafts: ",),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Color(0xff005baa),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("3", style: TextStyle(
                              color: Colors.white
                            ),)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          TextWidget(text: "Month: ",),
                          Text(" May 2026", style: TextStyle(
                            fontSize: 17
                          ),)
                        ],
                      ),
        
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Select a Van"),
                SizedBox(height: 7,),
                SearchBarWidget(),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  UserInfo(),
                  SizedBox(height: 15,),
                  UserInfo(),
                  SizedBox(height: 15,),
                  UserInfo(),
                  SizedBox(height: 15,),
                  UserInfo(),
                  SizedBox(height: 15,),
                  UserInfo(),
                  SizedBox(height: 15,),
                  UserInfo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
