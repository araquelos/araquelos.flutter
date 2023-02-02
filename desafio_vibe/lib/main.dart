import 'package:desafio_vibe/paginas/ted_detalhes.dart';
import 'package:desafio_vibe/paginas/ted_formulario.dart';
import 'package:desafio_vibe/paginas/ted_revisar.dart';
import 'package:desafio_vibe/provider/teds.dart';
import 'package:desafio_vibe/utilitarios/app_rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/ted_lista.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() => runApp(DesafioVibe());

class DesafioVibe extends StatelessWidget {
  DesafioVibe({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Teds(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        routes: {
          AppRotas.inicio: (_) => const PaginaInicial(),
          AppRotas.tedFormulario: (_) => const TedFormulario(),
          AppRotas.tedRevisar: (ctx) => const TedRevisar(),
          AppRotas.tedDetalhes: (ctx) => const TedDetalhes(),
        },
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
  @override
  Widget build(BuildContext context) {
    final Teds teds = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TED’s agendados',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {
              Navigator.of(context).pushNamed(
                AppRotas.tedFormulario,
              )
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TedLista(teds.all),
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
