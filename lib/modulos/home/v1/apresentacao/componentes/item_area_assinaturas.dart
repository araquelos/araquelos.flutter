import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class ItemAreaAssinaturas extends StatelessWidget {
  final String caminhoSvg;
  final Color corSvg;
  final String quantidade;
  final String rotulo;
  final AutoSizeGroup grupo;
  final Function()? aoClicar;

  const ItemAreaAssinaturas({
    super.key,
    required this.caminhoSvg,
    required this.corSvg,
    required this.quantidade,
    required this.rotulo,
    required this.grupo,
    this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoClicar,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.275,
        width: MediaQuery.of(context).size.width * 0.275,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 249, 249),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, 3),
                blurRadius: 15.0,
                spreadRadius: 3.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                caminhoSvg,
                color: corSvg,
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              AutoSizeText(
                quantidade,
                style: GoogleFonts.barlow(
                  fontWeight: FontWeight.bold,
                  color: InternetBankingCores.azul_500,
                ),
                presetFontSizes: const [14, 12],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.005,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width * 0.17,
                child: AutoSizeText(
                  rotulo,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.barlow(
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    color: InternetBankingCores.azul_500,
                    height: 1,
                  ),
                  group: grupo,
                  maxFontSize: 14,
                  minFontSize: 8,
                  stepGranularity: 1,
                  maxLines: 2,
                  // softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
