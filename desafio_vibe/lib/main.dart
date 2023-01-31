import 'package:desafio_vibe/paginas/ted_detalhes.dart';
import 'package:desafio_vibe/paginas/ted_formulario.dart';
import 'package:desafio_vibe/provider/teds.dart';
import 'package:desafio_vibe/utilitarios/app_rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'widgets/ted_lista.dart';
import 'modelos/ted.dart';

main() => runApp(DesafioVibe());

class DesafioVibe extends StatelessWidget {
  DesafioVibe({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Teds(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRotas.tedDetalhes: (ctx) => const TedDetalhes(),
          AppRotas.tedFormulario: (ctx) => TedFormulario(),
        },
        home: const PaginaInicial(),
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.pink,
          ),
          textTheme: tema.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            labelLarge: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final List<Ted> _teds = [];

  _addTed(int codBanco, int agencia, int conta, String cpf, double valor,
      DateTime data) {
    final newTed = Ted(
      id: Random().nextDouble().toString(),
      codBanco: codBanco,
      agencia: agencia,
      conta: conta,
      cpf: cpf,
      valor: valor,
      data: data,
    );

    setState(() {
      _teds.add(newTed);
    });

    Navigator.of(context).pop();
  }

  _removeTed(String id) {
    setState(() {
      _teds.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Teds teds = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TED’s agendados',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TedLista(
              teds.all,
              _removeTed,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRotas.tedFormulario,
          );
        },
        label: const Text('Agendar TED'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
