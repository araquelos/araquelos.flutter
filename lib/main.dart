import 'package:flutter/material.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/configuracao/fabrica_mock.dart';
import 'package:mobile_pj/configuracao/go_router_config.dart';
import 'package:mobile_pj/configuracao/theme_config.dart';
import 'package:mobile_pj/constantes/internet_banking_constantes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await configurarServicos();
  await configurarServicosMock();
  await configurarRepositorios();
  await configurarRepositoriosMock();
  await configurarBlocs();

  runApp(const Main());

  Map<Permission, PermissionStatus> permissoes = await [
    Permission.location,
    Permission.camera,
    Permission.phone,
  ].request();

  for (var element in permissoes.values) {
    if (element.isDenied || element.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: InternetBankingConstantesApp.nomeAplicativo,
        theme: mainTheme,
        routerConfig: router,
        supportedLocales: const [Locale('pt')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
