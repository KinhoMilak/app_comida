import 'package:app_comida/components/meals_item.dart';
import 'package:app_comida/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScren extends StatelessWidget {
  final List<Meal> favoritMeal;

  const FavoriteScren(this.favoritMeal, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoritMeal.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição favorita '),
      );
    } else {
      return ListView.builder(
          itemCount: favoritMeal.length,
          itemBuilder: ((context, index) {
            return MealItem(favoritMeal[index]);
          }));
    }
  }
}
