import 'package:flutter/material.dart';
import 'package:mealapp/Models/Category.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Widgets/Meal_Item.dart';
import 'package:mealapp/dummy_data.dart';


class Category_Meal_Screen extends StatefulWidget {
  static const Id="Category_Meal_Screen";
  final List<Meal> availableMeals;

  Category_Meal_Screen( this.availableMeals);
  @override
  _Category_Meal_ScreenState createState() => _Category_Meal_ScreenState();
}

class _Category_Meal_ScreenState extends State<Category_Meal_Screen> {


  @override
  Widget build(BuildContext context) {
    final  _category =ModalRoute.of(context).settings.arguments as Map<String,dynamic> ;
    final cate_Title = _category["title"];
    final cate_Id =_category["id"];
    final categoryMeal = widget.availableMeals.where((element){
      return element.categories.contains(cate_Id);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(cate_Title),),automaticallyImplyLeading: false,),
      body: ListView.builder(itemBuilder: (context,index){
        return MealItem(categoryMeal[index]);
      },
      itemCount: categoryMeal.length,),
    );
  }
}
