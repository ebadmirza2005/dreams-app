import 'package:flutter/material.dart';

import 'text.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final SearchController searchController = SearchController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SearchAnchor(
        searchController: searchController,
        isFullScreen: false,
        viewConstraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        viewTrailing: [
          IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: Icon(Icons.close),
          ),
        ],
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            hintText: "Driver name, vehicle number, or CNIC",
            trailing: <Widget>[Icon(Icons.search)],
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
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
                      CircleAvatar(child: Text("A")),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Ghulam Shabbir (KX-1339)",
                          ),
                          TextWidget(text: "CNIC: 4220145869879"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(child: Text("A")),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Imam Bux (BMD-940)"),
                          TextWidget(text: "CNIC: 4220165668978"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(child: Text("A")),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Nizam Din (JE-3224)"),
                          TextWidget(text: "CNIC: 4220155465623"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
