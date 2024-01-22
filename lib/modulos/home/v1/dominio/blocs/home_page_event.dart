part of 'home_page_bloc.dart';

sealed class HomePageEvent extends ReplayEvent {}

class HomePageEventIniciar extends HomePageEvent {}

class EventoIrParaAssinaturas extends HomePageEvent {
  final FiltroAssinaturaTipoTransacaoEnum filtro;

  EventoIrParaAssinaturas({required this.filtro});
}

class EventoAlternarVisibilidadePublicidade extends HomePageEvent {}
