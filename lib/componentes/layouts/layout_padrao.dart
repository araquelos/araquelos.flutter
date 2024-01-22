import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_icone.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

class LayoutPadrao extends StatelessWidget {
  final Function() acaoVoltar;
  final String titulo;
  final String subtitulo;
  final Widget conteudo;
  final List<Widget>? rodape;
  final List<Widget>? alerta;

  const LayoutPadrao({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.conteudo,
    required this.acaoVoltar,
    this.rodape,
    this.alerta,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        acaoVoltar();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 8, 31, 96), Color.fromARGB(255, 116, 14, 58)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          titleSpacing: 0,
          title: Container(
            height: MediaQuery.of(context).size.height * 0.075,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Row(
              children: [
                BotaoCabecalhoIcone(
                  icone: Icons.arrow_back,
                  funcao: acaoVoltar,
                ),
                const Spacer(),
                BotaoCabecalhoSvg(
                  tema: BotaoTemaEnum.transparente,
                  caminhoSvg: InternetBankingAssetsIcones.info,
                  funcao: () {},
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        titulo,
                        style: GoogleFonts.barlow(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        presetFontSizes: const [20, 18, 16, 14],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Transform.translate(
                  offset: const Offset(0, 1.25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 249, 249, 249),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Visibility(
              visible: subtitulo != "",
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            textAlign: TextAlign.center,
                            subtitulo,
                            style: GoogleFonts.barlow(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 23, 43, 77),
                            ),
                            presetFontSizes: const [20, 18, 16],
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: conteudo,
            ),
            Builder(
              builder: (context) {
                if (rodape != null && alerta != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.075,
                        ),
                        child: Column(
                          children: List.generate(alerta!.length, (index) => alerta![index]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.045,
                        ),
                        child: const Divider(
                          thickness: 2,
                          color: Color.fromRGBO(222, 222, 222, 1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.075,
                        ),
                        child: Column(
                          children: List.generate(rodape!.length, (index) => rodape![index]),
                        ),
                      ),
                    ],
                  );
                } else if (rodape != null && alerta == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.045,
                        ),
                        child: const Divider(
                          thickness: 2,
                          color: Color.fromRGBO(222, 222, 222, 1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.075,
                        ),
                        child: Column(
                          children: List.generate(rodape!.length, (index) => rodape![index]),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
