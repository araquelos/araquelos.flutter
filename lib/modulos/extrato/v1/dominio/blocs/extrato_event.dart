part of 'extrato_bloc.dart';

sealed class ExtratoEvent extends ReplayEvent {}

class ExtratoEventIniciar extends ExtratoEvent {}

class ExtratoEventLimparFiltros extends ExtratoEvent {}

class ExtratoEventFiltrarPeriodo extends ExtratoEvent {
  final FiltroExtratoPeriodoEnum filtroPeriodo;
  final DateTime dataInicial;
  final DateTime dataFinal;

  ExtratoEventFiltrarPeriodo({required this.filtroPeriodo, required this.dataInicial, required this.dataFinal});
}

class ExtratoEventFiltrar extends ExtratoEvent {
  final String? textoFiltro;
  final FiltroExtratoTipoTransacaoEnum? filtroTipoTransacao;
  final List<String> operacoesSelecionadas;
  final bool filtroOperacoesSelecionadasAlterado;

  ExtratoEventFiltrar({
    required this.textoFiltro,
    required this.filtroTipoTransacao,
    required this.operacoesSelecionadas,
    this.filtroOperacoesSelecionadasAlterado = false,
  });
}
