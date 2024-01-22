import 'package:flutter/services.dart';

abstract class GerenciadorInterfaceApp {
  static void alterarCorStatusBar(Color novaCor) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: novaCor,
        systemNavigationBarColor: const Color.fromARGB(255, 249, 249, 249),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
