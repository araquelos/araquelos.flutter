import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_acao_base.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoPrincipal extends StatelessWidget {
  final String texto;
  final Function() onPressed;

  const BotaoPrincipal({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoAcaoBase(
      texto: texto,
      corFundo: InternetBankingCores.azul_500,
      corFonte: InternetBankingCores.cinza_200,
      aoClicar: onPressed,
    );
  }
}
