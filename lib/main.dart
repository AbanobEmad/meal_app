import 'package:flutter/material.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Screens/Categories_Screen.dart';
import 'package:mealapp/Screens/Category_Meal_Screen.dart';
import 'package:mealapp/Screens/Filters_Screen.dart';
import 'package:mealapp/Screens/Meal_Details_Screen.dart';
import 'package:mealapp/Screens/Tab_screen.dart';
import 'package:mealapp/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
  "glutenFree" :false,
  "lactoseFree" :false,
  "vegan" :false,
  "vegetarian" :false,
};
  List<Meal> _availableMeals=DUMMY_MEALS;

  void _setFilter(Map<String,bool> _filtersData)
  {
    setState(() {
      _filters=_filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters["glutenFree"]&&!meal.isGlutenFree){
          return false;}
        if(_filters["lactoseFree"]&&!meal.isLactoseFree){
          return false;}
        if(_filters["vegan"]&&!meal.isVegan){
          return false;}
        if(_filters["vegetarian"]&&!meal.isVegetarian){
          return false;}
        return true;

      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                subtitle1: TextStyle(fontSize: 24,fontFamily: "RobotoCondensed"),
              )),
      initialRoute: "/",
      routes: {
        "/":(context)=>TabScreen(),
        Category_Meal_Screen.Id:(context)=>Category_Meal_Screen(_availableMeals),
        MealDeatailsScren.Id :(context)=>MealDeatailsScren(),
        FiltersScreen.Id:(context)=>FiltersScreen(_setFilter),
        MyHomePage.Id:(context)=>MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String Id="Home";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meal"),
        ),
        body: Category());
  }
}
