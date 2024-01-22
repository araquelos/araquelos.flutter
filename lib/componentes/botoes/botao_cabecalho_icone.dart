import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';

class BotaoCabecalhoIcone extends StatelessWidget {
  final IconData icone;
  final Function() funcao;
  final Widget? tag;
  final bool tagPisca;

  const BotaoCabecalhoIcone({
    super.key,
    required this.icone,
    required this.funcao,
    this.tag,
    this.tagPisca = false,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoCabecalhoBase(
      tema: BotaoTemaEnum.transparente,
      conteudo: Icon(
        icone,
        color: Colors.white,
      ),
      funcao: funcao,
      tag: tag,
      tagPisca: tagPisca,
    );
  }
}
