import 'package:flutter/material.dart';
import '../utils/app_bar.dart';
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
          SizedBox(height: 15,),
          TextWidget(
            text: "Van Inspection",
            textSize: 24,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Select a Van"),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SearchAnchor(
                  searchController: searchController,
                    isFullScreen: false,
                    viewConstraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.3
                    ),
                    viewTrailing: [
                      IconButton(onPressed: () {
                        searchController.clear();
                      }, icon: Icon(Icons.close))
                    ],
                    builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    hintText: "Driver name, vehicle number, or CNIC",
                    trailing: <Widget>[
                      Icon(Icons.search),
                    ],
                  );

                }, suggestionsBuilder: (BuildContext context, SearchController controller) {
                  // return List<ListTile>.generate(5, (int index) {

                     // final String item = 'item ${index}';
                     // return ListTile(
                     //   title: Text(item),
                     //   onTap: () {
                     //     setState(() {
                     //       controller.closeView(item);
                     //     });
                     //   },
                     // );
                  // });
                  return [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text("A"),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Ghulam Shabbir (KX-1339)",),
                                  TextWidget(text: "CNIC: 4220145869879",),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text("A"),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Imam Bux (BMD-940)",),
                                  TextWidget(text: "CNIC: 4220165668978",),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text("A"),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Nizam Din (JE-3224)",),
                                  TextWidget(text: "CNIC: 4220155465623",),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ];
                }),
              ),
            ],
          ),
          SizedBox(height: 40,),
          ButtonWidget(
            buttonText: "Next",
            buttonIcon: Icon(Icons.arrow_forward, size: 24,),
            textSize: 24,
          ),
          SizedBox(height: 70,),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 20,),
          TextWidget(text: "Van Inspection Forms History", textSize: 24,),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 120,
                  height: 56,
                  child: ButtonWidget(buttonText: "Drafts", textSize: 16, buttonIcon: Icon(Icons.edit), onTap: () {},)),
              SizedBox(width: 30,),
              SizedBox(
                  width: 156,
                  height: 56,
                  child: ButtonWidget(buttonText: "Submitted", textSize: 16, buttonIcon: Icon(Icons.check), onTap: () {},)),

            ],
          ),
        ],
      ),

    );
  }
}
