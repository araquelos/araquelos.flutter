import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import 'screens/months_reflections_screen.dart';
import 'screens/reflection_detail_screen.dart';
import 'screens/filters_screen.dart';
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
  List<Reflection> _availableReflections = dummyReflections;
  final List<Reflection> _reflectionDay = dummyReflections
      .where((x) =>
          x.day == DateTime.now().day && x.monthInt == DateTime.now().month)
      .toList();

  void _filterReflections(Filters filters) {
    setState(() {
      this.filters = filters;
      _availableReflections = dummyReflections.where((reflection) {
        final filterJanuary = filters.isJanuary && !reflection.isJanuary;
        final filterFebruary = filters.isFebruary && !reflection.isFebruary;
        final filterMarch = filters.isMarch && !reflection.isMarch;
        final filterApril = filters.isApril && !reflection.isApril;
        final filterMay = filters.isMay && !reflection.isMay;
        final filterJune = filters.isJune && !reflection.isJune;
        final filterJuly = filters.isJuly && !reflection.isJuly;
        final filterAugust = filters.isAugust && !reflection.isAugust;
        final filterSeptember = filters.isSeptember && !reflection.isSeptember;
        final filterOctober = filters.isOctober && !reflection.isOctober;
        final filterNovember = filters.isNovember && !reflection.isNovember;
        final filterDecember = filters.isDecember && !reflection.isDecember;
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

  bool _isReflectionDay(Reflection reflection) {
    return _reflectionDay.contains(reflection);
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
        AppRoutes.home: (ctx) => TabsScreen(_reflectionDay, false),
        AppRoutes.calendar: (ctx) => TabsScreen(_reflectionDay, true),
        AppRoutes.monthReflections: (ctx) =>
            MonthsReflectionsScreen(_availableReflections),
        AppRoutes.reflectionDetail: (ctx) =>
            ReflectionDetailScreen(_isReflectionDay),
        AppRoutes.filters: (ctx) => FiltersScreen(filters, _filterReflections),
      },
    );
  }
}
