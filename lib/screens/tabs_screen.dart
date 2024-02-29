import 'package:flutter/material.dart';
import 'months_screen.dart';
import 'reflection_day_screen.dart';
import '../models/reflection.dart';

class TabsScreen extends StatefulWidget {
  final List<Reflection> reflectionDay;
  final bool isCalendar;

  const TabsScreen(this.reflectionDay, this.isCalendar, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _selectedScreenIndex = widget.isCalendar == true ? 1 : 0;
    _screens = [
      {
        'title': '🙏 Reflexão do Dia',
        'screen': ReflectionDayScreen(widget.reflectionDay),
      },
      {
        'title': '📆 Calendário',
        'screen': const MonthsScreen(),
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
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Hoje',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendário',
          ),
        ],
      ),
    );
  }
}
