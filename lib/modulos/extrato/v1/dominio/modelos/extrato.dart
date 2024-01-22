import 'package:collection/collection.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/extrato_rodape.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento_diario.dart';

class Extrato {
  final DateTime dataInicio;
  final DateTime dataFim;
  final DateTime dataEmissao;
  final double saldoAnterior;
  final List<MovimentoDiario> movimentosDiarios;
  final List<ExtratoRodape> itensRodape;

  Extrato({
    required this.dataInicio,
    required this.dataFim,
    required this.dataEmissao,
    required this.saldoAnterior,
    required this.movimentosDiarios,
    required this.itensRodape,
  });

  factory Extrato.montarExtrato(String entrada) {
    List<String> lista =
        entrada.split("-----------------------------------------------------------------------------------------");

    List<String> listaCabecalho = lista[0].split("@");
    String dataInicio = listaCabecalho[1].substring(9, 19);
    dataInicio = dataInicio.split("/")[2] + dataInicio.split("/")[1] + dataInicio.split("/")[0];
    String dataFim = listaCabecalho[1].substring(22, 32);
    dataFim = dataFim.split("/")[2] + dataFim.split("/")[1] + dataFim.split("/")[0];
    String dataEmissao = listaCabecalho[1].substring(70, 89);
    dataEmissao =
        "${dataEmissao.split(" ")[0].split("/")[2]}-${dataEmissao.split(" ")[0].split("/")[1]}-${dataEmissao.split(" ")[0].split("/")[0]} ${dataEmissao.split(" ")[1]}";
    String saldoAnterior = listaCabecalho[3].split(" ")[listaCabecalho[3].split(" ").length - 1];

    List<String> listaMovimentos = lista[2].split("@");
    if (listaMovimentos[1].trim() == "NAO EXISTEM LANCAMENTOS NO PERIODO") {
      return Extrato(
        dataInicio: DateTime.parse(dataInicio),
        dataFim: DateTime.parse(dataFim),
        dataEmissao: DateTime.parse(dataEmissao),
        saldoAnterior: double.parse(saldoAnterior.replaceAll(".", "").replaceAll(",", ".")),
        movimentosDiarios: [],
        itensRodape: [],
      );
    }

    List<String> listaRodape = [];

    if (!lista[3].split("@")[1].startsWith("*")) {
      listaMovimentos.addAll(lista[3].split("@"));
      listaRodape = lista[4].split("@");
    } else {
      listaRodape = lista[3].split("@");
    }

    List<Movimento> movimentos = [];

    for (int i = 0; i < listaMovimentos.length; i++) {
      if (listaMovimentos[i].isEmpty) continue;
      if (listaMovimentos[i].startsWith(" ") || listaMovimentos[i].startsWith("L")) continue;

      String data = listaMovimentos[i].substring(0, 5);
      String descricao = listaMovimentos[i].substring(5, 43);
      String doc = listaMovimentos[i].substring(43, 49);
      double valor = double.parse(listaMovimentos[i].substring(49, 68).trim().replaceAll(".", "").replaceAll(",", "."));
      String? saldo = listaMovimentos[i].length >= 68 + 21 ? listaMovimentos[i].substring(68, 89).trim() : null;

      String? canal;
      String? descricaoDetalhada;
      String? beneficiado;

      if (i < listaMovimentos.length && listaMovimentos[i + 1].startsWith(" ")) {
        canal = listaMovimentos[i + 1].trim();
        if (i + 1 < listaMovimentos.length && listaMovimentos[i + 2].startsWith(" ")) {
          descricaoDetalhada = listaMovimentos[i + 2].trim();
          if (i + 2 < listaMovimentos.length && listaMovimentos[i + 3].startsWith(" ")) {
            beneficiado = listaMovimentos[i + 3].trim();
          }
        }
      }

      movimentos.add(Movimento(
        data: data,
        descricao: descricao.trim(),
        doc: doc.trim(),
        valor: valor,
        saldo: saldo,
        canal: canal,
        descricaoDetalhada: descricaoDetalhada,
        beneficiado: beneficiado,
      ));
    }

    List<ExtratoRodape> itensRodape = [];

    for (int i = 0; i < listaRodape.length; i++) {
      if (listaRodape[i].isEmpty || listaRodape[i][0] == " ") continue;

      String chave = listaRodape[i].substring(0, listaRodape[i].lastIndexOf(" ")).trim();
      String valor =
          listaRodape[i].substring(listaRodape[i].lastIndexOf(" ")).trim().replaceAll(".", "").replaceAll(",", ".");

      itensRodape.add(ExtratoRodape(
        chave: chave,
        valor: valor,
        temValor: valor.isNotEmpty,
      ));
    }

    var movimentosAgrupados = groupBy(
      movimentos,
      (Movimento movimento) => movimento.data,
    );

    List<MovimentoDiario> movimentosDiarios = [];

    movimentosAgrupados.forEach((chave, valor) {
      movimentosDiarios.add(
        MovimentoDiario(
          data: chave,
          saldo: valor.firstWhereOrNull((element) => element.saldo != null && element.saldo != "")?.saldo ?? "",
          movimentos: valor,
        ),
      );
    });

    return Extrato(
      dataInicio: DateTime.parse(dataInicio),
      dataFim: DateTime.parse(dataFim),
      dataEmissao: DateTime.parse(dataEmissao),
      saldoAnterior: double.parse(saldoAnterior.replaceAll(".", "").replaceAll(",", ".")),
      movimentosDiarios: movimentosDiarios.reversed.toList(),
      itensRodape: itensRodape,
    );
  }

  List<String> gerarListaOperacoes() {
    List<String> listaOperacoes = [];
    for (var movimentoDiario in movimentosDiarios) {
      listaOperacoes.addAll(movimentoDiario.movimentos.map((movimento) => movimento.descricao).toList());
    }

    return listaOperacoes.toSet().toList();
  }
}
