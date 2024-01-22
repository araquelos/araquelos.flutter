import 'package:flutter/material.dart';

@immutable
class ErroNegocioExcecao implements Exception {
  final int codigoRetorno;
  final String? mensagem;

  const ErroNegocioExcecao({required this.codigoRetorno, required this.mensagem});
}
