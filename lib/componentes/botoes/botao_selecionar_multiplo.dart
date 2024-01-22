import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoSelecionarMultiplo extends StatelessWidget {
  final String texto;
  final Function(bool) aoClicar;
  final bool selecionado;

  const BotaoSelecionarMultiplo({
    super.key,
    required this.texto,
    required this.aoClicar,
    required this.selecionado,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        texto,
        style: TextStyle(
          color: selecionado ? Colors.white : InternetBankingCores.azul_500,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      showCheckmark: false,
      backgroundColor: Colors.white,
      surfaceTintColor: InternetBankingCores.azul_500,
      selectedColor: InternetBankingCores.azul_500,
      side: BorderSide(color: selecionado ? InternetBankingCores.azul_500 : InternetBankingCores.cinza_300),
      selected: selecionado,
      onSelected: aoClicar,
    );
  }
}
