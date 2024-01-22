import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoMenu extends StatelessWidget {
  final BotaoTemaEnum tema;
  final String caminhoSvg;
  final double? tamanhoIcone;
  final String rotulo;
  final AutoSizeGroup grupo;
  final Function() funcao;

  const BotaoMenu({
    super.key,
    required this.tema,
    required this.caminhoSvg,
    this.tamanhoIcone,
    required this.funcao,
    required this.grupo,
    required this.rotulo,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.width * 0.23,
        maxHeight: MediaQuery.of(context).size.width * 0.4,
        maxWidth: MediaQuery.of(context).size.width * 0.17,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BotaoCabecalhoSvg(
            tema: tema,
            caminhoSvg: caminhoSvg,
            tamanhoBotao: MediaQuery.of(context).size.width * 0.17,
            tamanhoIcone: tamanhoIcone,
            funcao: funcao,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          AutoSizeText(
            rotulo,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
              color: switch (tema) {
                BotaoTemaEnum.transparente => InternetBankingCores.cinza_100,
                BotaoTemaEnum.solido => InternetBankingCores.azul_500,
              },
            ),
            wrapWords: false,
            maxFontSize: 12,
            minFontSize: 8,
            stepGranularity: 1,
            group: grupo,
          ),
        ],
      ),
    );
  }
}
