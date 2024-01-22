import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_icone.dart';
import 'package:mobile_pj/componentes/logo_banpara_horizontal.dart';

class CabecalhoTelaAutenticacao extends StatelessWidget {
  const CabecalhoTelaAutenticacao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Row(
          children: [
            const LogoBanparaHorizontal(),
            const Spacer(),
            BotaoCabecalhoIcone(
              icone: Icons.menu,
              funcao: () {},
            ),
          ],
        ),
      ),
    );
  }
}
