import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  List<Meal> favouritedMeals;

  FavouriteScreen(this.favouritedMeals);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouritedMeals.isEmpty)
      return Center(
        child: Text(
          'No Favourite Meals,try adding some!',
        ),
      );
    else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: widget.favouritedMeals[index].id,
            affordability: widget.favouritedMeals[index].affordability,
            complexity: widget.favouritedMeals[index].complexity,
            duration: widget.favouritedMeals[index].duration,
            imageUrl: widget.favouritedMeals[index].imageUrl,
            title: widget.favouritedMeals[index].title,
          );
        }),
        itemCount: widget.favouritedMeals.length,
      );
    }
  }
}
