import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPublicidade extends StatelessWidget {
  final bool visibilidade;
  final String caminhoImagem;
  final Color corFundo;
  final String titulo;
  final String mensagem;

  const CardPublicidade({
    super.key,
    required this.visibilidade,
    required this.caminhoImagem,
    required this.corFundo,
    required this.titulo,
    required this.mensagem,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: MediaQuery.of(context).size.height * (visibilidade ? 0.16 : 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: corFundo,
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: visibilidade ? MediaQuery.of(context).size.height * 0.1 : 0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(caminhoImagem),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.06,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.025,
              vertical: MediaQuery.of(context).size.height * 0.006,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AutoSizeText(
                    titulo,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    presetFontSizes: const [14, 12, 10],
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    mensagem,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    maxFontSize: 12,
                    minFontSize: 6,
                    stepGranularity: 1,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
