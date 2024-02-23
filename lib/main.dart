import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routes.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), //TextStyle
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
              primary: Colors.green,
              secondary: Colors.white,
            )
            .copyWith(background: Colors.white),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
