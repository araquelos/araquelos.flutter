part of 'atualizacao_cadastral_bloc.dart';

sealed class AtualizacaoCadastralEvent extends ReplayEvent {}

class EventoIrParaAviso extends AtualizacaoCadastralEvent {}

class EventoIrParaAtualizarContatos extends AtualizacaoCadastralEvent {}

class EventoEnviarSMSToken extends AtualizacaoCadastralEvent {}

class EventoConfirmarCodigo extends AtualizacaoCadastralEvent {}

class EventoSolicitarChamada extends AtualizacaoCadastralEvent {}

class EventoReenviarSMS extends AtualizacaoCadastralEvent {}
