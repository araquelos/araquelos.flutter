import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/month.dart';
import '../models/reflection.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Reflection> life_book;

  const CategoriesMealsScreen(this.life_book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Month;

    final categoryMeals = life_book.where((meal) {
      return meal.monthFilters.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
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
