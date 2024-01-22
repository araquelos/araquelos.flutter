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
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/campo_chave_pix.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/componentes/botao_meus_contatos.dart';
import 'package:mobile_pj/repositorios/contatos_pix_repositorio.dart';

part 'area_contatos_recentes_page.dart';
part 'area_outros_pagamentos_page.dart';

class PixPagarTransferir extends StatelessWidget {
  const PixPagarTransferir({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Pix - Pagar ou transferir',
      subtitulo: "",
      conteudo: Scrollbar(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  CampoChavePix(
                    label: 'Digite a chave Pix',
                    hintText: "CPF, CNPJ, Celular, E-mail",
                    keyboardType: TextInputType.text,
                    onTapCampo: () => context.pushNamed(
                        InternetBankingRotas.pixPagarTransferirEtapa1),
                    onTapColarChave: () => context.pushNamed(
                        InternetBankingRotas.pixPagarTransferirEtapa1,
                        extra: true),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const MeusContatosRecentes(),
                  const AreaOutrosPagamentos(),
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
