import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class TextNumeroVersao extends StatelessWidget {
  final String numeroVersao;

  const TextNumeroVersao({super.key, required this.numeroVersao});

  @override
  Widget build(BuildContext context) {
    return Text(
      numeroVersao,
      style: GoogleFonts.barlow(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: InternetBankingCores.cinza_300,
      ),
    );
  }
}
