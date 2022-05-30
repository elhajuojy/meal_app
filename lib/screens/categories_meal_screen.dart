import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //we get the id and title of the category of meals from route arg information
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              imgaeUrl: categorymeals[index].imageUrl,
              title: categorymeals[index].title,
              duration: categorymeals[index].duration,
              complexity: categorymeals[index].complexity,
              affordabiility: categorymeals[index].affordabiility);
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
