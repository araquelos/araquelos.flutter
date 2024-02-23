import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Calendário',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Mensagem de Hoje',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedScreenIndex]['title'] as String,
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.lime,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendário',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Hoje',
          ),
        ],
      ),
    );
  }
}
