import 'package:flutter/material.dart';

class TedRevisar extends StatelessWidget {
  const TedRevisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _formTed =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: AppBar(
        title: Text(_formTed['codBanco'].toString()),
        //title: const Text('Visualizar TED'),
      ),
    );
  }
}
