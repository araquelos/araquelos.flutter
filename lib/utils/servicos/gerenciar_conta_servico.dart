import 'dart:convert';

import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/conta_salva.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GerenciarContaServico {
  SharedPreferences preferencias;

  GerenciarContaServico({required this.preferencias});

  ContaSalva? obterUltimaContaAcessada() {
    if (!preferencias.containsKey("ultimaContaAcessada")) return null;

    return ContaSalva.fromJson(json.decode(preferencias.getString("ultimaContaAcessada")!));
  }

  List<ContaSalva>? listarContasSalvas() {
    if (!preferencias.containsKey("contas")) {
      return null;
    }
    return (json.decode(preferencias.getString("contas")!) as List).map((item) => ContaSalva.fromJson(item)).toList();
  }

  Future salvarConta(ContaSalva conta) async {
    if (preferencias.containsKey("ultimaContaAcessada")) await preferencias.remove("ultimaContaAcessada");
    await preferencias.setString("ultimaContaAcessada", json.encode(conta));

    final possuiContasSalvas = preferencias.containsKey("contas");
    if (possuiContasSalvas) {
      final listaContasSalvas = listarContasSalvas();
      if (listaContasSalvas!.where((item) => item.cpf == conta.cpf).isNotEmpty) {
        listaContasSalvas.removeWhere((item) => item.cpf == conta.cpf);
      }
      listaContasSalvas.add(conta);
      await preferencias.remove('contas');
      await preferencias.setString('contas', json.encode(listaContasSalvas));
      return;
    }
    List<ContaSalva> novaListaContas = <ContaSalva>[];
    novaListaContas.add(conta);
    await preferencias.setString('contas', json.encode(novaListaContas));
  }

  Future removerConta(ContaSalva conta) async {
    final listaContasSalvas = listarContasSalvas();
    listaContasSalvas!.remove(conta);
    await preferencias.remove('contas');

    if (conta == obterUltimaContaAcessada()) {
      await preferencias.remove("ultimaContaAcessada");
    }

    if (listaContasSalvas.isNotEmpty) {
      await preferencias.setString("ultimaContaAcessada", json.encode(listaContasSalvas[0]));
      await preferencias.setString('contas', json.encode(listaContasSalvas));
    }
  }

  bool possuiContaSalva() {
    return listarContasSalvas() != null;
  }
}
