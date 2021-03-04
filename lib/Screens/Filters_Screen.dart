import 'package:flutter/material.dart';
import 'package:mealapp/Screens/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String Id = "FilltersScreen";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget bulitSwitchListTile(
      String Title, String SubTitle, bool CurrentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(Title),
        subtitle: Text(SubTitle),
        activeColor: Theme.of(context).primaryColor,
        value: CurrentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Filters"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection .",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                bulitSwitchListTile("Gluten-Free",
                    "only include gluten free meals .", _glutenFree, (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                }),
                bulitSwitchListTile("Lactose-Free",
                    "only include lactose free meals .", _lactoseFree, (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                }),
                bulitSwitchListTile(
                  " Vegetarian",
                  "only include  vegetarian meals .",
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                bulitSwitchListTile(
                  "Vegan",
                  "only include vegan meals .",
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
