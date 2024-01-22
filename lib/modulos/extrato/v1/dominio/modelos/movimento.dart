import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';

enum TipoMovimento { entrada, saida }

class Movimento {
  final String data;
  final String descricao;
  final String doc;
  final double valor;
  final String? saldo;
  final String? canal;
  final String? descricaoDetalhada;
  final String? beneficiado;

  TipoMovimento get tipoMovimento => valor > 0 ? TipoMovimento.entrada : TipoMovimento.saida;

  Movimento({
    required this.data,
    required this.descricao,
    required this.doc,
    required this.valor,
    required this.saldo,
    required this.canal,
    required this.descricaoDetalhada,
    required this.beneficiado,
  });

  bool filtrar({
    required String? filtroTexto,
    required FiltroExtratoTipoTransacaoEnum? filtroTipoTransacao,
    required List<String> filtroOperacoes,
  }) {
    return (filtroTexto != null
            ? (descricao.toUpperCase().contains(filtroTexto.toUpperCase()) ||
                doc.toUpperCase().contains(filtroTexto.toUpperCase()))
            : true) &&
        (filtroTipoTransacao != null
            ? (filtroTipoTransacao == FiltroExtratoTipoTransacaoEnum.entradas
                ? tipoMovimento == TipoMovimento.entrada
                : tipoMovimento == TipoMovimento.saida)
            : true) &&
        (filtroOperacoes.isNotEmpty ? filtroOperacoes.contains(descricao) : true);
  }
}
