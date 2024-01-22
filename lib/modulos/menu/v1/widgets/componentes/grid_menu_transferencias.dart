import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_menu_grid.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

class GridMenuTransferencias extends StatelessWidget {
  const GridMenuTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: const <Widget>[
        BotaoMenuGrid(label: 'TED', icon: InternetBankingAssetsIcones.transferencias),
        BotaoMenuGrid(label: 'DOC', icon: InternetBankingAssetsIcones.transferencias),
      ],
    ));
  }
}
