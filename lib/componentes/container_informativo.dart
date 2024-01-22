import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';

enum TipoContainerInformativo {
  informacao,
  sucesso,
  erro,
}

class ContainerInformativo extends StatelessWidget {
  final TipoContainerInformativo tipoContainerInformativo;
  final String texto;

  const ContainerInformativo({
    super.key,
    required this.texto,
    this.tipoContainerInformativo = TipoContainerInformativo.informacao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      decoration: BoxDecoration(
        color: switch (tipoContainerInformativo) {
          TipoContainerInformativo.informacao => const Color.fromARGB(255, 238, 238, 238),
          TipoContainerInformativo.sucesso => const Color.fromARGB(255, 234, 249, 241),
          TipoContainerInformativo.erro => const Color.fromARGB(255, 254, 155, 155),
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: switch (tipoContainerInformativo) {
            TipoContainerInformativo.informacao => const Color.fromARGB(255, 206, 210, 218),
            TipoContainerInformativo.sucesso => const Color.fromARGB(255, 234, 249, 241),
            TipoContainerInformativo.erro => const Color.fromARGB(255, 254, 155, 155),
          },
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            height: 20,
            InternetBankingAssetsIcones.info,
            colorFilter: ColorFilter.mode(
              switch (tipoContainerInformativo) {
                TipoContainerInformativo.informacao => const Color.fromARGB(255, 160, 160, 160),
                TipoContainerInformativo.sucesso => const Color.fromARGB(255, 1, 169, 79),
                TipoContainerInformativo.erro => const Color.fromARGB(255, 252, 55, 55),
              },
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.025,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              texto,
            ),
          ),
        ],
      ),
    );
  }
}
