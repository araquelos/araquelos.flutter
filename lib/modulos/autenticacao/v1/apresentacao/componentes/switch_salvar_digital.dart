import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class SwitchSalvarDigital extends StatelessWidget {
  final bool value;
  final Function() onChanged;

  const SwitchSalvarDigital({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: FittedBox(
            child: Switch(
              value: value,
              onChanged: (value) {
                onChanged();
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Utilizar digital no próximo acesso',
          style: GoogleFonts.barlow(
            fontWeight: FontWeight.w500,
            color: InternetBankingCores.azul_500,
          ),
        ),
      ],
    );
  }
}
