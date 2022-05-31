import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoryMealScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal>? categorymeals;
  void _removeMeal(String mealId) {
    setState(() {
      categorymeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //we get the id and title of the category of meals from route arg information
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    categorymeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              removeItem: _removeMeal,
              id: categorymeals![index].id,
              imgaeUrl: categorymeals![index].imageUrl,
              title: categorymeals![index].title,
              duration: categorymeals![index].duration,
              complexity: categorymeals![index].complexity,
              affordabiility: categorymeals![index].affordabiility);
        },
        itemCount: categorymeals!.length,
      ),
    );
  }
}
