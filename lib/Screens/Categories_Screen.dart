import 'package:flutter/material.dart';
import 'package:mealapp/Widgets/CategoryItem.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/Models/Category.dart';

class Category extends StatelessWidget {
  static const Id="Category";
  @override
  Widget build(BuildContext context) {
    final Screenwidth=MediaQuery.of(context).size.width;
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((Data) =>
          CategoryItem(Data),
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: (Screenwidth/2)-25,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
      ),
    );
  }
}
