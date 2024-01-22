part of 'gerar_token_bloc.dart';

enum GerarTokenEtapa {
  empresaSelecionada,
  contaSelecionada,
  processando,
  tokenGerado,
  erro,
}

class GerarTokenState {
  final GerarTokenEtapa? etapa;
  final EmpresaToken? empresaSelecionada;
  final ContaToken? contaSelecionada;
  final String? token;
  final int? duracaoToken;

  GerarTokenState({
    required this.empresaSelecionada,
    required this.contaSelecionada,
    required this.token,
    required this.duracaoToken,
    required this.etapa,
  });

  GerarTokenState copyWith({
    GerarTokenEtapa? Function()? etapa,
    EmpresaToken? Function()? empresaSelecionada,
    ContaToken? Function()? contaSelecionada,
    String? Function()? token,
    int? Function()? duracaoToken,
  }) {
    return GerarTokenState(
      etapa: etapa != null ? etapa() : this.etapa,
      empresaSelecionada: empresaSelecionada != null ? empresaSelecionada() : this.empresaSelecionada,
      contaSelecionada: contaSelecionada != null ? contaSelecionada() : this.contaSelecionada,
      token: token != null ? token() : this.token,
      duracaoToken: duracaoToken != null ? duracaoToken() : this.duracaoToken,
    );
  }
}
