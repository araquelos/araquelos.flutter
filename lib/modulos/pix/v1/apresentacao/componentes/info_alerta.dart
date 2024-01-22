import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAlerta extends StatelessWidget {
  final String icone;
  final String info;
  final Color corFundo;
  final Color corBorda;
  final Color corTexto;
  final Color corIcone;

  const InfoAlerta({
    super.key,
    required this.icone,
    required this.info,
    this.corFundo = const Color.fromRGBO(43, 43, 43, 0.05),
    this.corBorda = const Color.fromRGBO(218, 206, 215, 1),
    this.corTexto = const Color.fromRGBO(43, 43, 43, 1),
    this.corIcone = const Color.fromRGBO(43, 43, 43, 0.4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 42,
      decoration: BoxDecoration(
        color: corFundo,
        border: Border.all(
          color: corBorda,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icone,
            height: 15,
            width: 15,
            // ignore: deprecated_member_use
            color: corIcone,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Flexible(
            child: AutoSizeText(
              info,
              style: GoogleFonts.barlow(
                fontSize: 12,
                color: corTexto,
                fontWeight: FontWeight.normal,
              ),
              presetFontSizes: const [12, 11],
            ),
          ),
        ],
      ),
    );
  }
}
