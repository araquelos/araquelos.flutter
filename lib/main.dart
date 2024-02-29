import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import 'screens/months_reflections_screen.dart';
import 'screens/reflection_detail_screen.dart';
import 'utils/app_routes.dart';
import 'models/reflection.dart';
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
  final List<Reflection> _availableReflections = dummyReflections;
  final List<Reflection> _reflectionDay = dummyReflections
      .where(
          (x) => (x.day == DateTime.now().day || x.day == 0) && (x.monthInt == DateTime.now().month || x.monthInt == 0))
      .toList();

  bool _isReflectionDay(Reflection reflection) {
    return _reflectionDay.contains(reflection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflexões da Vida',
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
        AppRoutes.home: (ctx) => TabsScreen(_reflectionDay, false),
        AppRoutes.calendar: (ctx) => TabsScreen(_reflectionDay, true),
        AppRoutes.monthReflections: (ctx) => MonthsReflectionsScreen(_availableReflections),
        AppRoutes.reflectionDetail: (ctx) => ReflectionDetailScreen(_isReflectionDay),
      },
    );
  }
}
