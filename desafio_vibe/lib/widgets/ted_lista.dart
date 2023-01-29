// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../modelos/ted.dart';
import 'package:intl/intl.dart';

import '../utilitarios/app_rotas.dart';

class TedLista extends StatelessWidget {
  final List<Ted> teds;
  //final Ted ted;
  final void Function(String) onRemove;

  const TedLista(
    this.teds,
    this.onRemove, {
    Key? key,
    /*required this.ted*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.valor}',
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
                      DateFormat('d MMM y').format(tr.data),
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
                            onPressed: () => onRemove(tr.id),
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
