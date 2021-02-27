import 'package:flutter/material.dart';
import 'package:mealapp/Screens/Categories_Screen.dart';
import 'package:mealapp/Screens/Category_Meal_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: MyHomePage(),
      routes: {
        "Home":(context)=>MyHomePage(),
        Category_Meal_Screen.Id:(context)=>Category_Meal_Screen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
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
