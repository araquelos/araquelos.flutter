import 'package:flutter/material.dart';
import '../components/reflection_item.dart';
import '../models/month.dart';
import '../models/reflection.dart';

class MonthsReflectionsScreen extends StatelessWidget {
  final List<Reflection> reflections;

  const MonthsReflectionsScreen(this.reflections, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final month = ModalRoute.of(context)!.settings.arguments as Month;

    final monthReflections = reflections.where((reflection) {
      return reflection.monthFilters.contains(month.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(month.title),
      ),
      body: ListView.builder(
        itemCount: monthReflections.length,
        itemBuilder: (ctx, index) {
          return ReflectionItem(monthReflections[index]);
        },
      ),
    );
  }
}
