import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class Busca extends StatelessWidget {
  final Function(String) funcao;

  const Busca({
    super.key,
    required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.barlow(
        fontSize: 16,
        color: InternetBankingCores.azul_500,
        fontWeight: FontWeight.w500,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: SvgPicture.asset(
          InternetBankingAssetsIcones.busca,
          fit: BoxFit.scaleDown,
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 47, 54, 142),
            BlendMode.srcIn,
          ),
        ),
        hintText: 'Procurar',
        hintStyle: GoogleFonts.barlow(
          color: const Color.fromARGB(255, 189, 189, 189),
          fontWeight: FontWeight.w400,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
      onChanged: funcao,
    );
  }
}
