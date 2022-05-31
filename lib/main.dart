import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_meal_screen.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favoritesScreen.dart';
import 'package:meal_app/screens/fliters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'guten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favortieMeals = [];

  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        ;
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        ;
        if (_filters['vegetaria'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
        ;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Flutter Demo',
        // home: const MyHomePage(),

        routes: {
          '/': (context) => TabsScreen(),
          '/category_meal': (context) => CategoryMealScreen(
                availableMeals: _availableMeals,
              ),
          '/MealDetailScreen': (context) => MealDetailScreen(),
          '/favScreen': (context) => FavoritesScreen(),
          '/FilterScreen': (context) => FiltersScreen(
                savefilters: _setFilters,
                currentFilters: _filters,
              ),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meal app"),
      ),
      body: Container(),
    );
  }
}
