import 'package:flutter/material.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/botao_meus_contatos_base.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';

class BotaoMeusContatos extends StatelessWidget {
  final RecebedorPix contatoSelecionado;

  const BotaoMeusContatos({
    super.key,
    required this.contatoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoMeusContatosBase(
      contatoSelecionado: contatoSelecionado,
    );
  }
}
