import 'package:app_comida/models/category.dart';
import 'package:app_comida/utils/app_routs.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRouts.categoriesMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return _selectCategory(context);
      }, // quando usuario clicar
      borderRadius: BorderRadius.circular(15), // bordas do click
      splashColor: Theme.of(context).colorScheme.primary, // cor do click
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              // degrade
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft, // onde comeca o degrade
              end: Alignment.bottomRight, // onde termina o degrade
            )), // espacamento interno do widget
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
