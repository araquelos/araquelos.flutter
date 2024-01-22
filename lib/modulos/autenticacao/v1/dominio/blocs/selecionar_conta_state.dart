part of 'selecionar_conta_bloc.dart';

class SelecionarContaState extends IEstadoBase<SelecionarContaState> {
  final List<ContaDTO> contas;

  SelecionarContaState({
    required this.contas,
  });

  @override
  SelecionarContaState copyWith({
    List<ContaDTO> Function()? contas,
  }) {
    return alterarEstado(
      novaInstancia: SelecionarContaState(
        contas: avaliarFuncao(funcao: contas, valorAtual: this.contas),
      ),
    );
  }
}
