import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/bottomsheet_detalhar_movimento.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento.dart';

class MovimentoTransacao extends StatelessWidget {
  final Movimento movimento;
  Color get cor => movimento.valor > 0 ? const Color.fromARGB(255, 15, 115, 79) : InternetBankingCores.cinza_500;

  const MovimentoTransacao({
    Key? key,
    required this.movimento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BottomSheetDetalharMovimento.exibir(context, movimento),
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          SvgPicture.asset(
            movimento.valor > 0
                ? InternetBankingAssetsIcones.entradaDinheiro
                : InternetBankingAssetsIcones.saidaDinheiro,
            height: 40,
            colorFilter: ColorFilter.mode(
              cor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movimento.descricao,
                style: TextStyle(
                  color: cor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                movimento.canal ?? "Outro Canal",
                style: TextStyle(
                  color: cor,
                  fontSize: 12,
                ),
              ),
              Text(
                "Doc ${movimento.doc}",
                style: TextStyle(
                  color: cor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            UtilBrasilFields.obterReal(movimento.valor),
            style: TextStyle(
              color: cor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          SvgPicture.asset(
            InternetBankingAssetsIcones.setaDireita,
            height: 12,
            width: 12,
            colorFilter: const ColorFilter.mode(
              InternetBankingCores.azul_500,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
