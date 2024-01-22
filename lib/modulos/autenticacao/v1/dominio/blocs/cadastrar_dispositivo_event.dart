part of 'cadastrar_dispositivo_bloc.dart';

sealed class CadastrarDispositivoEvent extends ReplayEvent {}

class EventoIniciar extends CadastrarDispositivoEvent {}

class EventoIrParaNomearDispositivo extends CadastrarDispositivoEvent {}

class EventoDefinirNome extends CadastrarDispositivoEvent {
  String nomeDispositivo;

  EventoDefinirNome({required this.nomeDispositivo});
}

class EventoIrParaAviso extends CadastrarDispositivoEvent {}

class EventoIrParaGuiaHabilitacao extends CadastrarDispositivoEvent {}

class EventoFinalizar extends CadastrarDispositivoEvent {}

class EventoLogoff extends CadastrarDispositivoEvent {}
