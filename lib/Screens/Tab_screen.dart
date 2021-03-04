import 'package:flutter/material.dart';
import 'package:mealapp/Screens/Categories_Screen.dart';
import 'package:mealapp/Screens/Favorites_Screen.dart';
import 'package:mealapp/Screens/MainDrawer.dart';

class TabScreen extends StatefulWidget {
  static const String Id="TabScreen";
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages=[
    {
      "page" : Category(),
      "title" : "Categories"
    },
    {
      "page" : FavoritesScreen(),
      "title" : "Favorites"
    }
  ];
  int _selectPageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]["title"]),),
      body: _pages[_selectPageIndex]["page"],
      bottomNavigationBar:  BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: "Categories"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
            label: "Favorites"
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex=value;
    });
  }
}
