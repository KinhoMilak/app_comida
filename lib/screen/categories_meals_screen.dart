import 'package:app_comida/models/category.dart';
import 'package:app_comida/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:app_comida/components/meals_item.dart';

class CatregoriesMealsScreem extends StatelessWidget {
  const CatregoriesMealsScreem(this.meals, {super.key});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals.where((meals) {
      return meals.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
