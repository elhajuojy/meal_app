import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget BuildLisTitle(String title, IconData icon, Function TapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 24, fontFamily: "", fontWeight: FontWeight.bold),
        ),
        onTap: () => TapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up !",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).backgroundColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildLisTitle("meal", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildLisTitle("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/FilterScreen');
          })
        ],
      ),
    );
  }
}
