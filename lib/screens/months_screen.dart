import 'package:flutter/material.dart';
import '../components/month_item.dart';
import '../data/dummy_data.dart';

class MonthsScreen extends StatelessWidget {
  const MonthsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 22,
        mainAxisSpacing: 22,
      ),
      children: dummyMonths.map((cat) {
        return MonthItem(cat);
      }).toList(),
    );
  }
}
