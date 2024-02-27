import 'package:flutter/material.dart';
import '../components/reflection_item.dart';
import '../models/reflection.dart';

class ReflectionDayScreen extends StatelessWidget {
  final List<Reflection> reflectionDay;

  const ReflectionDayScreen(this.reflectionDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (reflectionDay.isEmpty) {
      return const Center(
        child: Text('Nenhuma refleção hoje :('),
      );
    } else {
      return ListView.builder(
        itemCount: reflectionDay.length,
        itemBuilder: (ctx, index) {
          return ReflectionItem(reflectionDay[index]);
        },
      );
    }
  }
}
