import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  Function onClicked;

  DrawerItem(this.onClicked);

  static int category = 1;
  static int setting = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            height: 150,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Navigation",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClicked(category);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onClicked(setting) {}
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "My account",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              onClicked(setting) {}
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
