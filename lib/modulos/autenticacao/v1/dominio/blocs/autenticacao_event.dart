part of 'autenticacao_bloc.dart';

@immutable
sealed class AutenticacaoEvent extends ReplayEvent {}

class AutenticacaoEventIniciar extends AutenticacaoEvent {}

class AutenticacaoEventListarContasSalvas extends AutenticacaoEvent {}

class AutenticacaoEventSelecionarContaSalva extends AutenticacaoEvent {
  final ContaSalva contaSelecionada;

  AutenticacaoEventSelecionarContaSalva({
    required this.contaSelecionada,
  });
}

class AutenticacaoEventExcluirContaSalva extends AutenticacaoEvent {
  final ContaSalva contaSelecionada;

  AutenticacaoEventExcluirContaSalva({
    required this.contaSelecionada,
  });
}

class AutenticacaoEventEntrarNovaConta extends AutenticacaoEvent {}

class AutenticacaoEventAutenticar extends AutenticacaoEvent {
  final AutenticacaoFormulario formulario;

  AutenticacaoEventAutenticar({
    required this.formulario,
  });
}
