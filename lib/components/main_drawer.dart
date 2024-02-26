import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomLeft,
            child: RichText(
              text: TextSpan(
                text: 'O Livro da Vida 🍃',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\nJ. Krishnamurti',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.calendar_month,
            'Calendário',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.calendar),
          ),
          _createItem(
            Icons.edit_attributes_outlined,
            'Filtros',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.filters),
          ),
        ],
      ),
    );
  }
}
