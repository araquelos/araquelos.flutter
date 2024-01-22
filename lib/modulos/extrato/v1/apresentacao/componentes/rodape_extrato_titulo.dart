import 'package:flutter/material.dart';

class RodapeExtratoTitulo extends StatelessWidget {
  final String texto;
  const RodapeExtratoTitulo({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
          width: double.infinity,
        ),
        Container(
          height: 2,
          color: const Color.fromARGB(255, 228, 231, 236),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.015,
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 74, 74, 74),
            ),
          ),
        ),
      ],
    );
  }
}
