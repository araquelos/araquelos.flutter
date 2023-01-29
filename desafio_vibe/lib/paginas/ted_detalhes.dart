import 'package:desafio_vibe/modelos/ted.dart';
import 'package:flutter/material.dart';

class TedDetalhes extends StatelessWidget {
  const TedDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Ted ted = ModalRoute.of(context)!.settings.arguments as Ted;
    return Scaffold(
      appBar: AppBar(
        title: Text(ted.cpf),
      ),
    );
  }
}
