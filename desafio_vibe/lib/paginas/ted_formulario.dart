import 'package:flutter/material.dart';

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
                  if(value == null || value.trim().isEmpty) {return 'Código do Banco é obrigatório';}
                  if(value.trim().length < 3) {return 'Código do banco deve possuir até 3 dígitos';}
                },
                onSaved: (value) => _formTed['codBanco'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Agência'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'Agência é obrigatória';}
                  if(value.trim().length < 4) {return 'Agência deve possuir até 4 dígitos';}
                },
                onSaved: (value) => _formTed['agencia'] = value!,                
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Conta'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'Conta é obrigatória';}
                  if(value.trim().length < 10) {return 'Conta deve possuir até 10 dígitos';}
                },
                onSaved: (value) => _formTed['conta'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'CPF é obrigatório';}
                  if(value.trim().length < 11) {return 'CPF deve possuir 11 dígitos';}
                },
                onSaved: (value) => _formTed['cpf'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'Valor é obrigatório';}
                  if(double.parse(value) > 0 && double.parse(value) <= 10000) {return 'Valor deve ser um valor numérico superior a R\$ 0,00 e inferior a R\$ 10.000,00';}
                },
                onSaved: (value) => _formTed['valor'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {return 'Data é obrigatória';}
                },
                onSaved: (value) => _formTed['data'] = value!,),                
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
                            print(_formTed);
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
