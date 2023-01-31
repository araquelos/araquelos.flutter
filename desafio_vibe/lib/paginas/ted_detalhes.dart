import 'package:flutter/material.dart';

class TedDetalhes extends StatelessWidget {
  const TedDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _formTed = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    //final Ted ted = ModalRoute.of(context)!.settings.arguments as Ted;
    return Scaffold(
      appBar: AppBar(
        title: Text(_formTed['codBanco'].toString()),
        //title: const Text('Visualizar TED'),
      ),
    );
  }
}
