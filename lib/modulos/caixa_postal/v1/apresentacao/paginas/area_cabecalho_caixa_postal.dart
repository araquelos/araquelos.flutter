import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';

class AreaCabecalhoCaixaPostal extends StatefulWidget {
  const AreaCabecalhoCaixaPostal({super.key});

  @override
  State<AreaCabecalhoCaixaPostal> createState() => _AreaCabecalhoCaixaPostalState();
}

class _AreaCabecalhoCaixaPostalState extends State<AreaCabecalhoCaixaPostal> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.30,
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 31, 96),
              Color.fromARGB(255, 116, 14, 58),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            Row(
              children: [
                BotaoCabecalhoSvg(
                  tema: BotaoTemaEnum.transparente,
                  caminhoSvg: InternetBankingAssetsIcones.setaVoltar,
                  funcao: () => context.go(InternetBankingRotas.home),
                ),
                const Spacer(),
                BotaoCabecalhoSvg(
                  tema: BotaoTemaEnum.transparente,
                  caminhoSvg: InternetBankingAssetsIcones.info,
                  funcao: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AutoSizeText(
                  "Caixa Postal",
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  presetFontSizes: const [20, 18, 16, 14],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
