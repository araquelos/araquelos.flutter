import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BotaoMenuGrid extends StatelessWidget {
  final String label;
  final String icon;
  final String? route;

  const BotaoMenuGrid({
    super.key,
    required this.label,
    required this.icon,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 11, 33, 98),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 30,
            width: 30,
            // ignore: deprecated_member_use
            color: const Color.fromARGB(255, 11, 33, 98),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 11, 33, 98),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
