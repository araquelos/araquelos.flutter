import 'package:flutter/material.dart';

import '../modelos/ted.dart';

class TedFormulario extends StatelessWidget {
  const TedFormulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados da TED',style: TextStyle(color: Colors.white)),
      ),
      body: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  
  const Formulario({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  
  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();
    final _form = GlobalKey<FormState>();
    final Map<String, Object> _formTed = {};

    return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Código do Banco'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'Código Inválido';}
                },
                onSaved: (value) => _formTed['codBanco'] = value as Object,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Agência'),
                onSaved: (value) => _formTed['agencia'] = value as Object,                
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Conta'),
                onSaved: (value) => _formTed['conta'] = value as Object,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CPF'),
                onSaved: (value) => _formTed['cpf'] = value as Object,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                onSaved: (value) => _formTed['valor'] = value as Object,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data'),
                onSaved: (value) => _formTed['data'] = value as Object,),                
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        child: Text(
                          'Revisar',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.labelLarge?.color,
                          ),
                        ),
                        onPressed: () {
                          final isValid = _form.currentState?.validate();

                          if (isValid == true) {
                            _form.currentState?.save();
                            Navigator.of(context).pop();
                          }                          
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      child: ElevatedButton(
                        child: const Text('Voltar'),
                        onPressed: () {Navigator.of(context).pop();},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.color))),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
