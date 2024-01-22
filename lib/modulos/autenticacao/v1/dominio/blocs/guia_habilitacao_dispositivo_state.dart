part of 'guia_habilitacao_dispositivo_bloc.dart';

enum GuiaHabilitacaoDispositivoEtapa { pagina1, pagina2, pagina3, pagina4, pagina5, pagina6, pagina7 }

class GuiaHabilitacaoDispositivoState
    extends IEstadoComEtapa<GuiaHabilitacaoDispositivoState, GuiaHabilitacaoDispositivoEtapa> {
  GuiaHabilitacaoDispositivoState({required super.etapa});

  @override
  GuiaHabilitacaoDispositivoState copyWith({GuiaHabilitacaoDispositivoEtapa? Function()? etapa}) {
    return alterarEstado(
      novaInstancia: GuiaHabilitacaoDispositivoState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
      ),
    );
  }
}
