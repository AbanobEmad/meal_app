import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDeatailsScren extends StatelessWidget {
  static const String Id="MealDeatailsScren";
  Widget buildCintainer(Widget body)
  {
    return Container(
      decoration:BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ) ,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: body
    );
  }
  Widget buildText(BuildContext context, String Name)
  {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(Name ,style: Theme.of(context).textTheme.subtitle1,),
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(selectedMeal.title),),automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            buildText(context,"Ingredients" ),
            buildCintainer( ListView.builder(
              itemBuilder:(context,index )=> Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ) ,
              itemCount:selectedMeal.ingredients.length ,),),
            buildText(context, "Steps"),
            buildCintainer( ListView.builder(
              itemBuilder:(context,index )=> Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ],
              ) ,
              itemCount:selectedMeal.steps.length ,),),
          ],
        ),
      ),
    );
  }
}
