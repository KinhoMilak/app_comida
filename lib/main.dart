import 'package:app_comida/data/dammy_data.dart';
import 'package:app_comida/models/meal.dart';
import 'package:app_comida/models/settings.dart';
import 'package:app_comida/screen/categories_meals_screen.dart';
import 'package:app_comida/screen/meal_detail_screem.dart';
import 'package:app_comida/screen/settings_screen.dart';
import 'package:app_comida/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'utils/app_routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avalibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avalibleMeals = dummyMeals.where((meal) {
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetariano = settings.isVegetarian && !meal.isVegetarian;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        return !filterLactose &&
            !filterVegetariano &&
            !filterVegan &&
            !filterGlutten;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor:
            Colors.white, // tema do scafold ( fundo do app)
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),

        useMaterial3: true,
      ),
      //home: Categories_screen(), // desnecesario quando usa routa
      routes: {
        AppRouts.home: (ctx) {
          return TabScreen(_favoriteMeals);
        },
        AppRouts.categoriesMeals: (ctx) {
          return CatregoriesMealsScreem(_avalibleMeals);
        },
        AppRouts.mealDetail: (ctx) {
          return MealDetailScreen(_toggleFavorite, _isFavorite);
        },
        AppRouts.settings: (ctx) {
          return SettingsScreen(_filterMeals, settings);
        }
      },
    );
  }
}
