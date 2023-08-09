import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> filters = {
    'vegetarian': false,
    'vegan': false,
    'lactose-free': false,
    'gluten-free': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouritedMeals = [];

  void setFilters(Map<String, bool> newFilters) {
    setState(
      () {
        filters = newFilters;

        availableMeals = DUMMY_MEALS.where(
          (meal) {
            if (filters['gluten-free'] && !meal.isGlutenFree) {
              return false;
            }
            if (filters['lactose-free'] && !meal.isLactoseFree) {
              return false;
            }
            if (filters['vegetarian'] && !meal.isVegetarian) {
              return false;
            }
            if (filters['vegan'] && !meal.isVegan) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

  void toggleFavourite(String mealId) {
    final existingIndex = favouritedMeals.indexWhere(
      (meal) => meal.id == mealId,
    );

    if (existingIndex >= 0) {
      setState(() {
        favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String mealId) {
    return favouritedMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                fontFamily: 'RobotoCondensed-Bold',
                fontSize: 20,
              ),
            ),
      ),
      home: TabScreen(favouritedMeals),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavourite, isMealFavourite),
        FiltersScreen.routeName: ((context) => FiltersScreen(
              filters,
              setFilters,
            )),
      },
    );
  }
}
