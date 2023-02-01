import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utilitarios/app_rotas.dart';

class TedFormulario extends StatelessWidget {
  const TedFormulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova TED', style: TextStyle(color: Colors.white)),
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
  final _codBancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _contaController = TextEditingController();
  final _cpfController = TextEditingController();
  final _valorController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _codBancoController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Código do Banco é obrigatório';
                }
                if (value.trim().length < 3) {
                  return 'Código do banco deve possuir até 3 dígitos';
                }
              },
              onSaved: (value) => _formTed['codBanco'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Agência'),
              controller: _agenciaController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Agência é obrigatória';
                }
                if (value.trim().length < 4) {
                  return 'Agência deve possuir até 4 dígitos';
                }
              },
              onSaved: (value) => _formTed['agencia'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Conta'),
              controller: _contaController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Conta é obrigatória';
                }
                if (value.trim().length < 10) {
                  return 'Conta deve possuir até 10 dígitos';
                }
              },
              onSaved: (value) => _formTed['conta'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CPF'),
              controller: _cpfController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'CPF é obrigatório';
                }
                if (value.trim().length < 11) {
                  return 'CPF deve possuir 11 dígitos';
                }
              },
              onSaved: (value) => _formTed['cpf'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              controller: _valorController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Valor é obrigatório';
                }
                if (double.parse(value) == 0 || double.parse(value) > 10000) {
                  return 'Valor deve ser um valor numérico superior a R\$ 0,00 e inferior a R\$ 10.000,00';
                }
              },
              onSaved: (value) => _formTed['valor'] = value!,
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
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
                          color: Theme.of(context).textTheme.labelLarge?.color,
                        ),
                      ),
                      onPressed: () {
                        final isValid = _form.currentState?.validate();

                        if (isValid == true) {
                          _form.currentState?.save();
                          /*if (_selectedDate == null) {
                            return;
                          }*/
                          _formTed['data'] = _selectedDate!;
                          Navigator.of(context).pushNamed(
                            AppRotas.tedRevisar,
                            arguments: _formTed,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      child: const Text('Voltar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
