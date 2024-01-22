import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_acao_base.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoSecundario extends StatelessWidget {
  final String texto;
  final bool emLinha;
  final Function() onPressed;

  const BotaoSecundario({
    super.key,
    required this.texto,
    this.emLinha = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoAcaoBase(
      texto: texto,
      corFundo: const Color.fromARGB(255, 253, 253, 253),
      corFonte: InternetBankingCores.azul_500,
      corBorda: InternetBankingCores.azul_500,
      tamanhoBorda: 2,
      emLinha: emLinha,
      aoClicar: onPressed,
    );
  }
}
