import 'package:flutter/material.dart';

class RodapePagina extends StatelessWidget {
  final List<Widget> rodape;

  const RodapePagina({
    super.key,
    required this.rodape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 249, 249, 249),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: rodape,
      ),
    );
  }
}
