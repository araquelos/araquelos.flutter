import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BarraSuperior extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;

  const BarraSuperior({Key? key, required this.title, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            color: InternetBankingCores.azul_500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: InternetBankingCores.azul_500,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
