import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

class ContainerListagemVazia extends StatelessWidget {
  final String mensagem;

  const ContainerListagemVazia({
    super.key,
    required this.mensagem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          InternetBankingAssetsIcones.caixaVazia,
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 189, 189, 189),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Text(
            mensagem,
            style: const TextStyle(
              color: Color.fromARGB(255, 189, 189, 189),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
