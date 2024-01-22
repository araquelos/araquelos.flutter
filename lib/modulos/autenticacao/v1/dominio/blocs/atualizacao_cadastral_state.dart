part of 'atualizacao_cadastral_bloc.dart';

enum AtualizacaoCadastralEtapa {
  exibirAviso,
  exibirFormularioAtualizacao,
  exibirInserirToken,
}

class AtualizacaoCadastralState extends IEstadoComEtapa<AtualizacaoCadastralState, AtualizacaoCadastralEtapa> {
  DadosContatoDTO? dadosContato;
  String? assinatura;
  int? tempoValidade;

  AtualizacaoCadastralState({
    required super.etapa,
    required this.dadosContato,
    required this.assinatura,
    required this.tempoValidade,
  });

  @override
  AtualizacaoCadastralState copyWith({
    AtualizacaoCadastralEtapa Function()? etapa,
    DadosContatoDTO? Function()? dadosContato,
    String? Function()? assinatura,
    int? Function()? tempoValidade,
  }) {
    return alterarEstado(
      novaInstancia: AtualizacaoCadastralState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        dadosContato: avaliarFuncao(funcao: dadosContato, valorAtual: this.dadosContato),
        assinatura: avaliarFuncao(funcao: assinatura, valorAtual: this.assinatura),
        tempoValidade: avaliarFuncao(funcao: tempoValidade, valorAtual: this.tempoValidade),
      ),
    );
  }
}
