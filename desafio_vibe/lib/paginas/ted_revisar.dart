import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TedRevisar extends StatelessWidget {
  const TedRevisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _formTed =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    DateTime dataFormatada = DateTime.parse(_formTed['data'].toString());

    return Scaffold(
      appBar: AppBar(
        //title: Text(DateFormat("'Data numérica:' dd/MM/yyyy").format(dataFormatada)),
        //title: Text(_formTed['codBanco'].toString()),
        title: const Text('Confirmar TED'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => {},
          ),
        ],
      ),
      //body: ,
    );
  }
}
