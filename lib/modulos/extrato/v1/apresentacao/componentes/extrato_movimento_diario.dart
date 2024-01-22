import 'package:flutter/material.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/movimento_divisor.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/movimento_transacao.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento_diario.dart';

class ExtratoMovimentoDiario extends StatelessWidget {
  final MovimentoDiario movimentoDiario;
  const ExtratoMovimentoDiario({
    super.key,
    required this.movimentoDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovimentoDivisor(
          data: movimentoDiario.data,
          saldo: movimentoDiario.saldo,
        ),
        Column(
          children: List.generate(
            movimentoDiario.movimentos.length,
            (indexMovimento) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015,
                ),
                child: MovimentoTransacao(
                  movimento: movimentoDiario.movimentos.elementAt(indexMovimento),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
