import 'package:flutter/material.dart';
import 'text.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text("Dreams Operations"),
      centerTitle: true,
      bottom: PreferredSize(preferredSize: Size.fromHeight(20.0), child: Padding(
        padding: EdgeInsets.only(
            left: 28,
            right: 20
        ),
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "14 - Ghulam Shabbir",),
                TextWidget(text: "v2.0.1")
              ],
            ),
          ],
        ),
      )),
    );
  }

}











// Widget buildBottomBarScaffold() {
//   return Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisAlignment: .spaceEvenly,
//         children: <Widget>[Text('Page Index = $screenIndex')],
//       ),
//     ),
//     bottomNavigationBar: NavigationBar(
//       selectedIndex: screenIndex,
//       onDestinationSelected: (int index) {
//         setState(() {
//           screenIndex = index;
//         });
//       },
//       destinations: destinations.map((ExampleDestination destination) {
//         return NavigationDestination(
//           label: destination.label,
//           icon: destination.icon,
//           selectedIcon: destination.selectedIcon,
//           tooltip: destination.label,
//         );
//       }).toList(),
//     ),
//   );
// }



