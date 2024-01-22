part of 'gerar_token_bloc.dart';

@immutable
sealed class GerarTokenEvent {}

class GerarTokenEventEmpresaSelecionada extends GerarTokenEvent {
  final EmpresaToken empresaSelecionada;

  GerarTokenEventEmpresaSelecionada({required this.empresaSelecionada});
}

class GerarTokenEventCpfSelecionado extends GerarTokenEvent {
  final ContaToken contaSelecionada;

  GerarTokenEventCpfSelecionado({required this.contaSelecionada});
}

class GerarTokenEventDisparar extends GerarTokenEvent {}
