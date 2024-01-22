import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_menu_grid.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

class GridMenuConsultas extends StatelessWidget {
  const GridMenuConsultas({super.key});

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
        BotaoMenuGrid(label: 'Saldo', icon: InternetBankingAssetsIcones.moneyBill1Regular),
        BotaoMenuGrid(label: 'Extrato', icon: InternetBankingAssetsIcones.extrato),
        BotaoMenuGrid(label: 'Extrato\nConta Mais', icon: InternetBankingAssetsIcones.extrato),
        BotaoMenuGrid(label: 'Agendamento', icon: InternetBankingAssetsIcones.calendario),
        BotaoMenuGrid(label: 'Reemissão de\nComprovante', icon: InternetBankingAssetsIcones.documentoDolar),
      ],
    ));
  }
}
