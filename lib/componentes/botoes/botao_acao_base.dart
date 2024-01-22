import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoAcaoBase extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final Color corFonte;
  final double tamanhoBorda;
  final Color corBorda;
  final bool emLinha;
  final Function() aoClicar;

  const BotaoAcaoBase({
    super.key,
    required this.texto,
    required this.corFundo,
    required this.corFonte,
    this.tamanhoBorda = 0,
    this.corBorda = Colors.transparent,
    this.emLinha = false,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoClicar,
      child: AspectRatio(
        aspectRatio: emLinha ? 4 / 1 : 6 / 1,
        child: Ink(
          decoration: BoxDecoration(
            color: corFundo,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: corBorda,
              width: tamanhoBorda,
            ),
          ),
          child: Center(
            child: AutoSizeText(
              texto,
              style: GoogleFonts.barlow(
                color: corFonte,
                fontWeight: FontWeight.w600,
              ),
              presetFontSizes: const [14, 12, 10],
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
