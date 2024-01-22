import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class PlaceholderCarregamento extends StatelessWidget {
  const PlaceholderCarregamento({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
        child: Column(
          children: [
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 47, 54, 142),
              backgroundColor: Color.fromARGB(255, 242, 244, 247),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Expanded(
              child: AutoSizeText(
                "Carregando",
                style: TextStyle(
                  color: InternetBankingCores.azul_500,
                ),
                presetFontSizes: [14, 12, 10, 8, 6],
              ),
            )
          ],
        ),
      ),
    );
  }
}
