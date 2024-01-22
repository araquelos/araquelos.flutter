import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque_base.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoDestaque extends StatelessWidget {
  final String titulo;
  final String icone;
  final Function() funcao;

  const BotaoDestaque({super.key, required this.titulo, required this.icone, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return BotaoDestaqueBase(
      tema: BotaoDestaqueTemaEnum.botao,
      icone: SvgPicture.asset(
        icone,
        height: 38,
        width: 38,
        colorFilter: const ColorFilter.mode(
          InternetBankingCores.azul_500,
          BlendMode.srcIn,
        ),
      ),
      rotulo: titulo,
      aoClicar: funcao,
    );
  }
}
