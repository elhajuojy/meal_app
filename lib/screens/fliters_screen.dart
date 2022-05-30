import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  Widget buildSwitchListTitle(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(title),
        onChanged: updateValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTitle("Gluten-free",
                  'only include gluten-free meals', _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              buildSwitchListTitle(
                  "Lactose-free",
                  'only include Lactose-free meals',
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
              buildSwitchListTitle(
                  "Vegetarian", 'only include Vegetarian meals', _isVegetarian,
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              buildSwitchListTitle(
                  "Vegan", 'only include Vegan meals', _isVegan, (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
