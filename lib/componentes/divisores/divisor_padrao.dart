import 'package:flutter/material.dart';

class DivisorPadrao extends StatelessWidget {
  const DivisorPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      color: Color.fromRGBO(222, 222, 222, 1),
    );
  }
}
