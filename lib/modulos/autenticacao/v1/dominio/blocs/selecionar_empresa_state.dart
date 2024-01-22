part of 'selecionar_empresa_bloc.dart';

class SelecionarEmpresaState extends IEstadoBase<SelecionarEmpresaState> {
  final List<AcessoEmpresaDTO> empresas;

  SelecionarEmpresaState({
    required this.empresas,
  });

  @override
  SelecionarEmpresaState copyWith({
    List<AcessoEmpresaDTO> Function()? empresas,
  }) {
    return alterarEstado(
      novaInstancia: SelecionarEmpresaState(
        empresas: avaliarFuncao(funcao: empresas, valorAtual: this.empresas),
      ),
    );
  }
}
