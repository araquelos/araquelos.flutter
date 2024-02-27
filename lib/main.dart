import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routes.dart';
import 'models/reflection.dart';
import 'models/filters.dart';
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
  Filters filters = Filters();
  List<Reflection> _availableMeals = dummyMessages;
  final List<Reflection> _favoriteMeals =
      dummyMessages.where((x) => x.day == DateTime.now().day && x.monthInt == DateTime.now().month).toList();

  void _filterMeals(Filters filters) {
    setState(() {
      this.filters = filters;
      _availableMeals = dummyMessages.where((meal) {
        final filterJanuary = filters.isJanuary && !meal.isJanuary;
        final filterFebruary = filters.isFebruary && !meal.isFebruary;
        final filterMarch = filters.isMarch && !meal.isMarch;
        final filterApril = filters.isApril && !meal.isApril;
        final filterMay = filters.isMay && !meal.isMay;
        final filterJune = filters.isJune && !meal.isJune;
        final filterJuly = filters.isJuly && !meal.isJuly;
        final filterAugust = filters.isAugust && !meal.isAugust;
        final filterSeptember = filters.isSeptember && !meal.isSeptember;
        final filterOctober = filters.isOctober && !meal.isOctober;
        final filterNovember = filters.isNovember && !meal.isNovember;
        final filterDecember = filters.isDecember && !meal.isDecember;
        return !filterJanuary &&
            !filterFebruary &&
            !filterMarch &&
            !filterApril &&
            !filterMay &&
            !filterJune &&
            !filterJuly &&
            !filterAugust &&
            !filterSeptember &&
            !filterOctober &&
            !filterNovember &&
            !filterDecember;
      }).toList();
    });
  }

  void _toggleFavorite(Reflection meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Reflection meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livro da Vida',
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
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals, false),
        AppRoutes.calendar: (ctx) => TabsScreen(_favoriteMeals, true),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.filters: (ctx) => SettingsScreen(filters, _filterMeals),
      },
    );
  }
}
