import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class SwitchSalvarContato extends StatelessWidget {
  final bool value;
  final Function() onChanged;

  const SwitchSalvarContato({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Salvar contato para transações futuras',
          style: GoogleFonts.barlow(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: InternetBankingCores.azul_500,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
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
      ],
    );
  }
}
