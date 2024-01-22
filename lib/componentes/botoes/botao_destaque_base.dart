import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

enum BotaoDestaqueTemaEnum {
  lista,
  botao,
}

class BotaoDestaqueBase extends StatelessWidget {
  final Widget icone;
  final BotaoDestaqueTemaEnum tema;

  final String? rotulo;
  final String? labelSuperior;
  final String? labelInferior;
  final String? valorSuperior;
  final String? valorInferior;

  final bool negrito;
  final bool exibirBorda;
  final Function()? aoClicar;
  final Function()? aoSegurar;

  const BotaoDestaqueBase({
    super.key,
    required this.icone,
    required this.tema,
    this.rotulo,
    this.labelSuperior,
    this.valorSuperior,
    this.labelInferior,
    this.valorInferior,
    this.negrito = false,
    this.exibirBorda = true,
    this.aoClicar,
    this.aoSegurar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: exibirBorda
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  offset: const Offset(0, 3),
                  blurRadius: 15.0,
                  spreadRadius: 3.0,
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: aoClicar,
          onLongPress: aoSegurar,
          borderRadius: BorderRadius.circular(5),
          child: AspectRatio(
            aspectRatio: 9 / 2,
            child: Ink(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.019,
                horizontal: MediaQuery.of(context).size.height * 0.019,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Builder(
                builder: (context) {
                  switch (tema) {
                    case BotaoDestaqueTemaEnum.lista:
                      return Row(
                        children: [
                          icone,
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  "${labelSuperior ?? "Valor não informado"}:",
                                  style: GoogleFonts.barlow(
                                    color: InternetBankingCores.azul_500,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  presetFontSizes: const [14, 12],
                                ),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "${labelInferior ?? "Valor não informado"}:",
                                  style: GoogleFonts.barlow(
                                    fontSize: 14,
                                    color: InternetBankingCores.azul_500,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  presetFontSizes: const [14, 12],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    valorSuperior ?? "Valor não informado",
                                    style: GoogleFonts.barlow(
                                      fontSize: 14,
                                      color: const Color.fromARGB(255, 47, 54, 142),
                                      fontWeight: negrito ? FontWeight.bold : FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    valorInferior ?? "Valor não informado",
                                    style: GoogleFonts.barlow(
                                      fontSize: 14,
                                      color: const Color.fromARGB(255, 47, 54, 142),
                                      fontWeight: negrito ? FontWeight.bold : FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    case BotaoDestaqueTemaEnum.botao:
                      return Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          icone,
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              rotulo ?? "Valor não informado",
                              style: const TextStyle(
                                color: InternetBankingCores.azul_500,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              presetFontSizes: const [14, 12],
                            ),
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
