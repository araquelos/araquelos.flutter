import 'package:flutter/material.dart';
import '../utilitarios/app_rotas.dart';

class TedFormulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();

  TedFormulario({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dados da TED',
          style: TextStyle(color: Colors.white),
        ),
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
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              InputDatePickerFormField(
                firstDate: firstDate, 
                lastDate: lastDate,
                fieldLabelText: 'Data',
                initialDate: DateTime.now()),
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
                          Navigator.of(context).pushNamed(
                            AppRotas.tedDetalhes,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      child: ElevatedButton(
                        child: const Text('Voltar'),
                        onPressed: () {
                            Navigator.of(context).pushNamed(
                            AppRotas.principal,
                          );},
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
      ),
    );
  }
}
