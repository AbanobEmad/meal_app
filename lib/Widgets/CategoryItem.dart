import 'package:flutter/material.dart';
import 'package:mealapp/Models/Category.dart';
import 'package:mealapp/Screens/Category_Meal_Screen.dart';

class CategoryItem extends StatelessWidget {
  final  _Category ;


  CategoryItem(this._Category);
  void Categoryitem(BuildContext context)
  {
    Navigator.of(context).pushNamed( Category_Meal_Screen.Id,
        arguments: {
       'id':_Category.id,
        'title':_Category.title
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Categoryitem(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: Center(child: Text(_Category.title,style: Theme.of(context).textTheme.subtitle1,),),
        decoration: BoxDecoration(
          color: _Category.color,
          gradient: LinearGradient(
            colors: [
              _Category.color.withOpacity(.5),
              _Category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
