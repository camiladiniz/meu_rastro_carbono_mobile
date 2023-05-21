import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/menu_navigate_item_model.dart';

Drawer drawerWidget(BuildContext context) {

  void onSelectItem (String pageName) {
    Navigator.pop(context); // close the drawer
    Modular.to.pushNamed(pageName);
  }

  final drawerItems = [
    NavigateItemModel("Créditos", Icons.library_books_rounded, () => {})
  ];

  // String currentProfilePic =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  List<Widget> buildListTiles() {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        onTap: () => onSelectItem('/references'),
        iconColor: Colors.green,
        textColor: Colors.black87,
        titleTextStyle: const TextStyle(fontSize: 15)
      ));
    }
    return drawerOptions;
  }

  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        // UserAccountsDrawerHeader(
        //   accountEmail: new Text("bramvbilsen@gmail.com"),
        //   accountName: new Text("Bramvbilsen"),
        //   currentAccountPicture: new GestureDetector(
        //     child: new CircleAvatar(
        //       backgroundImage: new NetworkImage(currentProfilePic),
        //     ),
        //     onTap: () => print("This is your current account."),
        //   ),
        // ),
        // const DrawerHeader(
        //   // decoration: BoxDecoration(
        //   //   color: Colors.blue,
        //   // ),
        //   child: Text('Drawer Header'),
        // ),
        ...buildListTiles(),
      ],
    ),
  );
}
