part of 'cadastrar_dispositivo_bloc.dart';

enum CadastrarDispositivoEtapa {
  exibirAviso,
  exibirNomearDispositivo,
  exibirAvisoPrimeiraHabilitacao,
  exibirAvisoOTPExpirado,
  exibirAvisoNovaHabilitacao,
  exibirErroCadastroMultifatorial,
}

class CadastrarDispositivoState extends IEstadoComEtapa<CadastrarDispositivoState, CadastrarDispositivoEtapa> {
  String? nomeDispositivo;
  String? mensagemErroMultifatorial;

  CadastrarDispositivoState({
    required super.etapa,
    required this.nomeDispositivo,
    required this.mensagemErroMultifatorial,
  });

  @override
  CadastrarDispositivoState copyWith({
    CadastrarDispositivoEtapa Function()? etapa,
    String? Function()? nomeDispositivo,
    String? Function()? mensagemErroMultifatorial,
  }) {
    return alterarEstado(
      novaInstancia: CadastrarDispositivoState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        nomeDispositivo: avaliarFuncao(funcao: nomeDispositivo, valorAtual: this.nomeDispositivo),
        mensagemErroMultifatorial:
            avaliarFuncao(funcao: mensagemErroMultifatorial, valorAtual: this.mensagemErroMultifatorial),
      ),
    );
  }
}
