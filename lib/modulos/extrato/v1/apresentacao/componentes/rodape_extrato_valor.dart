import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/extrato_rodape.dart';

class RodapeExtratoValor extends StatelessWidget {
  final ExtratoRodape item;
  const RodapeExtratoValor({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.003,
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.chave,
          ),
          Text(
            UtilBrasilFields.obterReal(double.parse(item.valor)),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: InternetBankingCores.azul_500,
            ),
          )
        ],
      ),
    );
  }
}
