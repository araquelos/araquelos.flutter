// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Ted_Formulario extends StatefulWidget {
  final void Function(int, int, int, String, double, DateTime) onSubmit;

  const Ted_Formulario(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<Ted_Formulario> createState() => _Ted_FormularioState();
}

class _Ted_FormularioState extends State<Ted_Formulario> {
  final _codBancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _contaController = TextEditingController();
  final _cpfController = TextEditingController();
  final _valorController = TextEditingController();
  DateTime? _dataSelecionada = DateTime.now();

  _submitForm() {
    final codBanco = int.tryParse(_codBancoController.text) ?? 0;
    final agencia = int.tryParse(_agenciaController.text) ?? 0;
    final conta = int.tryParse(_contaController.text) ?? 0;
    final cpf = _cpfController.text;
    final valor = double.tryParse(_valorController.text) ?? 0;

    if (codBanco <= 0 ||
        agencia <= 0 ||
        conta <= 0 ||
        cpf.isEmpty ||
        valor <= 0 ||
        _dataSelecionada == null) {
      return;
    }

    widget.onSubmit(codBanco, agencia, conta, cpf, valor, _dataSelecionada!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _dataSelecionada = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _codBancoController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Código do Banco',
              ),
            ),
            TextField(
              controller: _agenciaController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Agência',
              ),
            ),
            TextField(
              controller: _contaController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Conta',
              ),
            ),
            TextField(
              controller: _cpfController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'CPF',
              ),
            ),
            TextField(
              controller: _valorController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _dataSelecionada == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_dataSelecionada!)}',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                    'Agendar TED',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
