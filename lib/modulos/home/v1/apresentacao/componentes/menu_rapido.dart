import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/componentes/botoes/botao_menu.dart';

class MenuRapido extends StatelessWidget {
  MenuRapido({super.key});

  AutoSizeGroup grupoRotulos = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BotaoMenu(
          tema: BotaoTemaEnum.transparente,
          caminhoSvg: InternetBankingAssetsIcones.qrcode,
          funcao: () {},
          grupo: grupoRotulos,
          rotulo: "QR Code",
        ),
        BotaoMenu(
          tema: BotaoTemaEnum.transparente,
          caminhoSvg: InternetBankingAssetsIcones.pix,
          funcao: () => context.pushNamed(InternetBankingRotas.areaPix),
          grupo: grupoRotulos,
          rotulo: "Área Pix",
        ),
        BotaoMenu(
          tema: BotaoTemaEnum.transparente,
          caminhoSvg: InternetBankingAssetsIcones.extrato,
          tamanhoIcone: MediaQuery.of(context).size.width * 0.06,
          funcao: () => context.pushNamed(InternetBankingRotas.reemissaoComprovante),
          grupo: grupoRotulos,
          rotulo: "Comprovante",
        ),
        BotaoMenu(
          tema: BotaoTemaEnum.transparente,
          caminhoSvg: InternetBankingAssetsIcones.todos,
          funcao: () {},
          grupo: grupoRotulos,
          rotulo: "Todos",
        ),
        BotaoMenu(
          tema: BotaoTemaEnum.transparente,
          caminhoSvg: InternetBankingAssetsIcones.todos,
          funcao: () {},
          grupo: grupoRotulos,
          rotulo: "Todos",
        ),
      ],
    );
  }
}
