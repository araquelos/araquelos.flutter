import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class ContainerRevisao extends StatelessWidget {
  final String titulo;
  final List<Map<String, String>> lista;

  const ContainerRevisao({
    super.key,
    required this.titulo,
    required this.lista,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.035,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 243, 245),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                InternetBankingAssetsIcones.moeda,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  InternetBankingCores.azul_500,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                titulo,
                style: const TextStyle(
                  color: Color.fromARGB(255, 74, 74, 74),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Column(
            children: List.generate(
              lista.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.005,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        lista[index].entries.first.key,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        lista[index].entries.first.value,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: InternetBankingCores.azul_500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
