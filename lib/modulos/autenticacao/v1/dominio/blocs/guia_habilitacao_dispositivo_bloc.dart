import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'guia_habilitacao_dispositivo_event.dart';
part 'guia_habilitacao_dispositivo_state.dart';

class GuiaHabilitacaoDispositivoBloc
    extends InternetBankingBlocBase<GuiaHabilitacaoDispositivoEvent, GuiaHabilitacaoDispositivoState> {
  GerenciadorUsuario gerenciadorUsuario;

  GuiaHabilitacaoDispositivoBloc({
    required this.gerenciadorUsuario,
  }) : super(GuiaHabilitacaoDispositivoState(
          etapa: GuiaHabilitacaoDispositivoEtapa.pagina1,
        )) {
    on<GuiaHabilitacaoDispositivoEvent>((evento, emit) async {
      switch (evento) {
        case EventoNavegarProximo():
          await _onNavegarProximo(emit);
        case EventoNavegarAnterior():
          await _onNavegarAnterior(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<GuiaHabilitacaoDispositivoState> emit) async {}

  Future<void> _onNavegarProximo(Emitter<GuiaHabilitacaoDispositivoState> emit) async {
    switch (state.etapa!) {
      case GuiaHabilitacaoDispositivoEtapa.pagina1:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina2));
      case GuiaHabilitacaoDispositivoEtapa.pagina2:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina3));
      case GuiaHabilitacaoDispositivoEtapa.pagina3:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina4));
      case GuiaHabilitacaoDispositivoEtapa.pagina4:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina5));
      case GuiaHabilitacaoDispositivoEtapa.pagina5:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina6));
      case GuiaHabilitacaoDispositivoEtapa.pagina6:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina7));
      case GuiaHabilitacaoDispositivoEtapa.pagina7:
        emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
    }
  }

  Future<void> _onNavegarAnterior(Emitter<GuiaHabilitacaoDispositivoState> emit) async {
    switch (state.etapa!) {
      case GuiaHabilitacaoDispositivoEtapa.pagina1:
        emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
      case GuiaHabilitacaoDispositivoEtapa.pagina2:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina1));
      case GuiaHabilitacaoDispositivoEtapa.pagina3:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina2));
      case GuiaHabilitacaoDispositivoEtapa.pagina4:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina3));
      case GuiaHabilitacaoDispositivoEtapa.pagina5:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina4));
      case GuiaHabilitacaoDispositivoEtapa.pagina6:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina5));
      case GuiaHabilitacaoDispositivoEtapa.pagina7:
        emit(state.copyWith(etapa: () => GuiaHabilitacaoDispositivoEtapa.pagina6));
    }
  }
}
