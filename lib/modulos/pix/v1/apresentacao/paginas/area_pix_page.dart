import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/componentes/botoes/botao_menu.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/card_publicidade.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque.dart';

part 'area_pix_area_botoes_destaque_part_page.dart';
part 'area_pix_area_mais_opcoes_part_page.dart';
part 'area_pix_area_portabilidade_part_page.dart';
part 'area_pix_area_canal_atendimento_part_page.dart';

class AreaPix extends StatelessWidget {
  const AreaPix({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Área Pix',
      subtitulo: "",
      conteudo: Scrollbar(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const AreaBotoesDestaque(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  AreaMaisOpcoes(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const AreaPortabilidade(),
                  const AreaCanalAtendimento(),
                ],
              ),
            ),
          ),
        ),
      ),
      acaoVoltar: () => context.pop(),
    );
  }
}
