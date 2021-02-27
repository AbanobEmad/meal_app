import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imageScr;

  MealItem(this.imageScr);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imageScr),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
