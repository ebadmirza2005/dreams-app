import 'package:dreams_app/utils/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/button.dart';
import '../utils/text.dart';

class VanInspectionScreen extends StatefulWidget {
  const VanInspectionScreen({super.key});

  @override
  State<VanInspectionScreen> createState() => _VanInspectionScreenState();
}

class _VanInspectionScreenState extends State<VanInspectionScreen> {
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
                  context.go('/');
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
            SizedBox(height: 15),
            TextWidget(text: "Van Inspection", textSize: 24),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Select a Van"),
                SizedBox(height: 10),
                SearchBarWidget()
              ],
            ),
            SizedBox(height: 40),
            DefaultButton(buttonText: "Next", buttonIcon: Icons.arrow_forward, onTap: () => context.go("/review"),),
            SizedBox(height: 20),
            Divider(indent: 20, endIndent: 20),
            TextWidget(text: "Van Inspection Forms History", textSize: 24),
            SizedBox(height: 40),
            Column(
              children: [
                Badge(
                  label: const Text("3"),
                  alignment: Alignment.topRight,
                  child: DefaultButton(
                    buttonText: "Drafts",
                    buttonIcon: Icons.edit,
                    onTap: () => context.go('/draft'),
                  ),
                ),

                SizedBox(height: 15,),
                Badge(
                    label: const Text("1"),
                    child: DefaultButton(buttonText: "Pending", buttonIcon: Icons.pending, onTap: () {},)),
                SizedBox(height: 15,),
                Badge(
                    label: const Text("10"),
                    child: DefaultButton(buttonText: "Submitted", buttonIcon: Icons.check, onTap: () {},)),
                SizedBox(height: 15,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
