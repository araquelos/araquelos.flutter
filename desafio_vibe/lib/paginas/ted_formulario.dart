import 'package:flutter/material.dart';

class TedFormulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  TedFormulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados da TED'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Código do Banco'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Agência'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Conta'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CPF'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              InputDatePickerFormField(
                firstDate: DateTime.now(),
                lastDate: DateTime.now(),
                fieldLabelText: 'Data2',

                //decoration: const InputDecoration(labelText: 'Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
