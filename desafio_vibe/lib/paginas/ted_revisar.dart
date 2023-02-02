import 'package:desafio_vibe/modelos/ted.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/teds.dart';
import '../utilitarios/app_rotas.dart';

class TedRevisar extends StatelessWidget {
  const TedRevisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _formTed =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    DateTime dataFormatada = DateTime.parse(_formTed['data'].toString());
    double valorFormatado = double.parse(
        _formTed['valor'].toString().replaceAll('.', '').replaceAll(',', '.'));
    final Teds teds = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Confirmar TED', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/money-transfer.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Revise os dados antes de enviar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Valor',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formTed['codBanco'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Agência',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formTed['agencia'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Conta',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formTed['conta'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'CPF',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formTed['cpf'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Valor',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'R\$${_formTed['valor'].toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Data',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd/MM/yyyy').format(dataFormatada),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
                                'Confirmar',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.color,
                                ),
                              ),
                              onPressed: () {
                                teds.put(Ted(
                                    id: '',
                                    codBanco: int.parse(
                                        _formTed['codBanco'].toString()),
                                    agencia: int.parse(
                                        _formTed['agencia'].toString()),
                                    conta: _formTed['conta'].toString(),
                                    cpf: _formTed['cpf'].toString(),
                                    valor: valorFormatado,
                                    data: dataFormatada));
                                Navigator.of(context).pushNamed(
                                  AppRotas.inicio,
                                );
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
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
