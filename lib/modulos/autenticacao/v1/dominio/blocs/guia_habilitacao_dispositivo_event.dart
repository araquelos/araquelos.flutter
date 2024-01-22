part of 'guia_habilitacao_dispositivo_bloc.dart';

sealed class GuiaHabilitacaoDispositivoEvent extends ReplayEvent {}

class EventoNavegarProximo extends GuiaHabilitacaoDispositivoEvent {}

class EventoNavegarAnterior extends GuiaHabilitacaoDispositivoEvent {}
