import 'package:flutter/material.dart';
import 'package:mealapp/Screens/Categories_Screen.dart';
import 'package:mealapp/Screens/Filters_Screen.dart';
import 'package:mealapp/main.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed"),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 34),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed("/");
          }),
          SizedBox(
            height: 20,
          ),
          buildListTile("Filters", Icons.settings, () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(FiltersScreen.Id);
          })
        ],
      ),
    );
  }
}
