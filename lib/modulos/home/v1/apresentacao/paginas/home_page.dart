import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/componentes/logo_banpara_horizontal.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/card_saldo.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/item_area_assinaturas.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/menu_rapido.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/publicidade_slider.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/home_page_bloc.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

part 'area_cabecalho_part_page.dart';
part 'area_assinaturas_part_page.dart';
part 'area_publicidade_part_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AreaCabecalho(),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child: const AreaAssinaturas()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const AreaPublicidade(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
