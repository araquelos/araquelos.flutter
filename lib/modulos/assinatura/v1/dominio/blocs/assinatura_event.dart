part of 'assinatura_bloc.dart';

@immutable
sealed class AssinaturaEvent extends ReplayEvent {}

class AssinaturaEventIniciar extends AssinaturaEvent {}

class AssinaturaEventSelecionarOperacao extends AssinaturaEvent {
  final OperacaoMinificadaDTO operacaoSelecionada;

  AssinaturaEventSelecionarOperacao({
    required this.operacaoSelecionada,
  });
}

class AssinaturaEventAvancarPagina extends AssinaturaEvent {}

class AssinaturaEventAssinar extends AssinaturaEvent {
  final int idOperacao;
  AssinaturaEventAssinar({
    required this.idOperacao,
  });
}

class AssinaturaEventCancelar extends AssinaturaEvent {
  final int idOperacao;

  AssinaturaEventCancelar({
    required this.idOperacao,
  });
}

class AssinaturaEventMudarFiltro extends AssinaturaEvent {
  final String texto;
  final FiltroAssinaturaTipoTransacaoEnum filtro;

  AssinaturaEventMudarFiltro({
    required this.texto,
    required this.filtro,
  });
}

class AssinaturaEventVoltar extends AssinaturaEvent {}

class AssinaturaEventLogoff extends AssinaturaEvent {}
