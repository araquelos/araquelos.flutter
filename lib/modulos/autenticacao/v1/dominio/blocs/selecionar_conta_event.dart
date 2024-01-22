part of 'selecionar_conta_bloc.dart';

sealed class SelecionarContaEvent extends ReplayEvent {}

class SelecionarContaEventContaSelecionada extends SelecionarContaEvent {
  final ContaDTO contaSelecionada;

  SelecionarContaEventContaSelecionada({required this.contaSelecionada});
}

class SelecionarContaEventLogoff extends SelecionarContaEvent {}
