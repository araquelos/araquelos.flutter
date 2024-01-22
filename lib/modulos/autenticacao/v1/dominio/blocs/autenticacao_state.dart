part of 'autenticacao_bloc.dart';

enum AutenticacaoEtapa {
  exibirAutenticacaoContaSalva,
  exibirAutenticacaoNovaConta,
  exibirListaContasSalvas,
}

class AutenticacaoState extends IEstadoComEtapa<AutenticacaoState, AutenticacaoEtapa> {
  final bool dispositivoPossuiBiometria;
  final ContaSalva? ultimaContaAcessada;
  final List<ContaSalva>? listaContasSalvas;

  AutenticacaoState({
    required super.etapa,
    required this.ultimaContaAcessada,
    required this.listaContasSalvas,
    required this.dispositivoPossuiBiometria,
  });

  @override
  AutenticacaoState copyWith({
    AutenticacaoEtapa? Function()? etapa,
    bool Function()? dispositivoPossuiBiometria,
    ContaSalva? Function()? ultimaContaAcessada,
    List<ContaSalva>? Function()? listaContasSalvas,
  }) {
    return alterarEstado(
      novaInstancia: AutenticacaoState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        ultimaContaAcessada: avaliarFuncao(funcao: ultimaContaAcessada, valorAtual: this.ultimaContaAcessada),
        listaContasSalvas: avaliarFuncao(funcao: listaContasSalvas, valorAtual: this.listaContasSalvas),
        dispositivoPossuiBiometria:
            avaliarFuncao(funcao: dispositivoPossuiBiometria, valorAtual: this.dispositivoPossuiBiometria),
      ),
    );
  }
}
