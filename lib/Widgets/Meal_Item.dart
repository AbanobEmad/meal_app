import 'package:flutter/material.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Screens/Meal_Details_Screen.dart';

class MealItem extends StatelessWidget {
  final  meal;

  MealItem(this.meal);
  String getDeruction()
  {
    String Dur=meal.duration.toString();
    Dur+=" mine";
    return Dur;
  }
  String get ComplexpityText{
    String complexity=meal.complexity.toString();
    if(complexity=="Complexity.Simple")
      {
        return 'Simple';
      }
    else if("Complexity.Hard"==complexity)
      {
        return 'Hard';
      }
    else if("Complexity.Challenging"==complexity)
    {
      return 'Challenging';
    }
    else
      {
        return 'UnKnown';
      }
  }
  String get AffordabilityText{
    String affordability=meal.affordability.toString();
    if(affordability=="Affordability.Affordable")
    {
      return 'Affordable';
    }
    else if("Affordability.Pricey"==affordability)
    {
      return 'Pricey';
    }
    else if("Affordability.Luxurious"==affordability)
    {
      return 'Luxurious';
    }
    else
    {
      return 'UnKnown';
    }
  }
  void selectMeal(BuildContext context)
  {
    Navigator.of(context).pushNamed(MealDeatailsScren.Id,arguments: meal.id);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ()=>
        selectMeal(context)
     ,
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(meal.imageUrl,width: screenWidth,height: 250,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                    right: 10,
                    child: Container(
                      width: (screenWidth/3)*2,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      color: Colors.black54,
                        child: Text(
                            meal.title,
                          style: TextStyle(fontSize: 26,color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),)
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(width: 6,),
                      Text(getDeruction())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(width: 6,),
                      Text("$ComplexpityText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(width: 6,),
                      Text("$AffordabilityText")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
