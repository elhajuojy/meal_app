// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:meal_app/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  // FavoritesScreen(
  //   this.favortieMeals,
  // );
  // final List<Meal> favortieMeals;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('You have no favorites yet - start adding some !'),
    );
  }
}
