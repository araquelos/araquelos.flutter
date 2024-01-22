import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_menu_grid.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

class GridMenuPix extends StatelessWidget {
  const GridMenuPix({super.key});

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
        BotaoMenuGrid(label: 'Pix via\nQr Code', icon: InternetBankingAssetsIcones.pix),
        BotaoMenuGrid(label: 'Pix via\nChave', icon: InternetBankingAssetsIcones.pix),
        BotaoMenuGrid(label: 'Pix\nManual', icon: InternetBankingAssetsIcones.pix),
        BotaoMenuGrid(label: 'Pix Copia\ne Cola', icon: InternetBankingAssetsIcones.pix),
        BotaoMenuGrid(label: 'Receber', icon: InternetBankingAssetsIcones.pix),
        BotaoMenuGrid(label: 'Minhas\nChaves', icon: InternetBankingAssetsIcones.pix),
      ],
    ));
  }
}
