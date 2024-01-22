import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';
import 'package:mobile_pj/utils/status_processamento.dart';
import 'package:shimmer/shimmer.dart';

class ValorSaldo extends StatelessWidget {
  final SaldoState estado;
  final double? valor;

  const ValorSaldo({
    super.key,
    required this.estado,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      child: Row(
        children: [
          Text(
            "R\$",
            style: GoogleFonts.barlow(
              fontSize: 12.0,
              color: InternetBankingCores.cinza_100,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Builder(
            builder: (context) {
              if (estado.statusProcessamento == StatusProcessamento.processando) {
                return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(70, 255, 255, 255),
                  highlightColor: const Color.fromARGB(150, 255, 255, 255),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(90, 255, 255, 255),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                );
              }

              if (estado.indicadorVisibilidade) {
                return AutoSizeText(
                  UtilBrasilFields.obterReal(valor!, moeda: false),
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.w600,
                    color: InternetBankingCores.cinza_100,
                  ),
                  presetFontSizes: const [18],
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(30, 255, 255, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
