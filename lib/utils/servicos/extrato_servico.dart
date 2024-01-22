import 'dart:convert';

import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/movimento_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExtratoServico {
  SharedPreferences preferencias;

  ExtratoServico({required this.preferencias});

  List<MovimentoDTO>? listarMovimentos() {
    if (!preferencias.containsKey("movimentos")) {
      return null;
    }
    return (json.decode(preferencias.getString("movimentos")!) as List)
        .map((item) => MovimentoDTO.fromJson(item))
        .toList();
  }

  Future burcarSaldoDisponivel(double saldoDisponivel) async {}
}
