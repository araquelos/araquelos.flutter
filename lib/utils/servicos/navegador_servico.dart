import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/utils/estado_base.dart';

abstract class NavegadorServico {
  static void utilitario(BuildContext context, IEstadoBase state) {
    if (state.rotaDestino != null) {
      if (state.rotaDestino == InternetBankingRotas.autenticacao || state.rotaDestino == InternetBankingRotas.home) {
        context.go(state.rotaDestino!);
      } else {
        context.pushNamed(
          state.rotaDestino!,
          queryParameters: state.parametrosRotaDestino ?? <String, dynamic>{},
        );
      }
    }

    if (state.pop) {
      context.pop();
    }
  }
}
