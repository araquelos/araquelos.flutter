import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/termo_responsabilidade_repositorio.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'termo_responsabilidade_event.dart';
part 'termo_responsabilidade_state.dart';

class TermoResponsabilidadeBloc
    extends InternetBankingBlocBase<TermoResponsabilidadeEvent, TermoResponsabilidadeState> {
  ITermoResponsabilidadeRepositorio termoResponsabilidadeRepositorio;
  GerenciadorUsuario gerenciadorUsuario;

  TermoResponsabilidadeBloc({
    required this.termoResponsabilidadeRepositorio,
    required this.gerenciadorUsuario,
  }) : super(TermoResponsabilidadeState()) {
    on<TermoResponsabilidadeEvent>((evento, emit) async {
      switch (evento) {
        case TermoResponsabilidadeEventAceiteTermo():
          await _onAceiteTermo(evento, emit);
        case TermoResponsabilidadeEventRecusaTermo():
          await onLogoff(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<TermoResponsabilidadeState> emit) async {}

  Future<void> _onAceiteTermo(
    TermoResponsabilidadeEventAceiteTermo evento,
    Emitter<TermoResponsabilidadeState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());
      await termoResponsabilidadeRepositorio.aceitarTermoResponsabilidade(gerenciadorUsuario.usuario!.codigoSessao);
      gerenciadorUsuario.registrarAceiteTermoResponsabilidade();
      emit(state.fecharModalProcessamento());

      emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }
}
