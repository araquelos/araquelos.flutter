part of 'selecionar_empresa_bloc.dart';

@immutable
sealed class SelecionarEmpresaEvent extends ReplayEvent {}

class SelecionarEmpresaEventEmpresaSelecionada extends SelecionarEmpresaEvent {
  final AcessoEmpresaDTO empresaSelecionada;

  SelecionarEmpresaEventEmpresaSelecionada({required this.empresaSelecionada});
}

class SelecionarEmpresaEventLogoff extends SelecionarEmpresaEvent {}
