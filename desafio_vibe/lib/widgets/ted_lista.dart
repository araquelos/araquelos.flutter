import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelos/ted.dart';
import 'package:intl/intl.dart';

import '../provider/teds.dart';
import '../utilitarios/app_rotas.dart';

class TedLista extends StatelessWidget {
  final List<Ted> teds;

  const TedLista(
    this.teds, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Teds tedsProvider = Provider.of(context);

    return SizedBox(
      height: 430,
      child: teds.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Você não tem TED’s agendados!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 0),
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    'assets/images/wallet.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: teds.length,
              itemBuilder: (ctx, index) {
                final tr = teds[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            UtilBrasilFields.obterReal(tr.valor),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.cpf,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy').format(tr.data),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRotas.tedDetalhes,
                                arguments: tr,
                              );
                            },
                            icon: const Icon(Icons.remove_red_eye),
                            color: Theme.of(context).colorScheme.background),
                        IconButton(
                            onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Excluir TED'),
                                    content: const Text(
                                        'Tem certeza que deseja excluir esse agendamento?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Não'),
                                        child: const Text('Não'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Sim');
                                          tedsProvider.remove(tr);
                                        },
                                        child: const Text('Sim'),
                                      ),
                                    ],
                                  ),
                                ),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).colorScheme.error),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
