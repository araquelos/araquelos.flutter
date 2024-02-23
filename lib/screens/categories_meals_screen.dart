import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> life_book;

  const CategoriesMealsScreen(this.life_book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = life_book.where((meal) {
      return meal.categories.contains(category.id);
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
