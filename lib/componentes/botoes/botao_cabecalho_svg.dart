import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoCabecalhoSvg extends StatelessWidget {
  final BotaoTemaEnum tema;

  final String caminhoSvg;
  final double? tamanhoBotao;
  final double? tamanhoIcone;
  final Function() funcao;
  final Widget? tag;
  final bool tagPisca;

  const BotaoCabecalhoSvg({
    super.key,
    required this.tema,
    required this.caminhoSvg,
    required this.funcao,
    this.tamanhoBotao,
    this.tamanhoIcone,
    this.tag,
    this.tagPisca = false,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoCabecalhoBase(
      tema: tema,
      funcao: funcao,
      conteudo: SvgPicture.asset(
        caminhoSvg,
        colorFilter: ColorFilter.mode(
          switch (tema) {
            BotaoTemaEnum.transparente => Colors.white,
            BotaoTemaEnum.solido => InternetBankingCores.azul_500,
          },
          BlendMode.srcIn,
        ),
        width: tamanhoIcone ??
            (tamanhoBotao != null ? (tamanhoBotao! * 0.4615) : MediaQuery.of(context).size.width * 0.06),
      ),
      tamanhoBotao: tamanhoBotao,
      tag: tag,
      tagPisca: tagPisca,
    );
  }
}
