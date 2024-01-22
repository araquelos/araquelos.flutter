import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoSelecionar extends StatelessWidget {
  final String titulo;
  final bool selecionado;
  final Function(bool) funcao;

  const BotaoSelecionar({
    super.key,
    required this.titulo,
    required this.selecionado,
    required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: AutoSizeText(
        titulo,
        style: TextStyle(
          color: selecionado ? InternetBankingCores.cinza_100 : InternetBankingCores.azul_500,
          fontWeight: FontWeight.w600,
        ),
        presetFontSizes: const [13, 11, 9],
      ),
      selected: selecionado,
      showCheckmark: false,
      backgroundColor: Colors.white,
      selectedColor: InternetBankingCores.azul_500,
      side: BorderSide(
        color: (selecionado ? InternetBankingCores.azul_500 : InternetBankingCores.cinza_300),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onSelected: funcao,
    );
  }
}
