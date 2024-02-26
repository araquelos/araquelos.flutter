import 'package:flutter/material.dart';
import '../models/month.dart';
import '../utils/app_routes.dart';

class MonthItem extends StatelessWidget {
  final Month month;

  const MonthItem(this.month, {Key? key}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoriesMeals,
      arguments: month,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              month.color.withOpacity(0.5),
              month.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          month.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
