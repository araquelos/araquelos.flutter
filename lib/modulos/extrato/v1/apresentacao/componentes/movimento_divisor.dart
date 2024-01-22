import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class MovimentoDivisor extends StatelessWidget {
  final String data;
  final String saldo;

  const MovimentoDivisor({
    Key? key,
    required this.data,
    required this.saldo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: GoogleFonts.barlow(
                color: InternetBankingCores.cinza_500,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              saldo != "" ? 'Saldo do dia R\$ $saldo' : saldo,
              style: GoogleFonts.barlow(
                color: InternetBankingCores.cinza_500,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          height: 2,
          color: const Color.fromARGB(255, 228, 231, 236),
        )
      ],
    );
  }
}
