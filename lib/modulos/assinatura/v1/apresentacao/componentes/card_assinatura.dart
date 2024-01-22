import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class CardAssinatura extends StatelessWidget {
  final String caminhoSvg;
  final Color corSvg;
  final String valor;
  final String rotulo;
  final DateTime data;
  final AutoSizeGroup grupo;
  final Function()? aoClicar;

  const CardAssinatura({
    super.key,
    required this.caminhoSvg,
    required this.corSvg,
    required this.valor,
    required this.rotulo,
    required this.data,
    required this.grupo,
    this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: aoClicar,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.width * 0.200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                offset: const Offset(0, 3),
                blurRadius: 15.0,
                spreadRadius: 3.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              SvgPicture.asset(
                caminhoSvg,
                colorFilter: ColorFilter.mode(
                  corSvg,
                  BlendMode.srcIn,
                ),
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    rotulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: InternetBankingCores.azul_500,
                    ),
                  ),
                  Text(
                    "Em ${DateFormat("dd/MM/yyyy").format(data)}, às ${DateFormat("HH:mm").format(data)}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 43, 43, 43),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                valor,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: InternetBankingCores.azul_400,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              SvgPicture.asset(
                InternetBankingAssetsIcones.setaDireita,
                height: 15,
                colorFilter: const ColorFilter.mode(
                  InternetBankingCores.azul_500,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
