import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/selecionar_conta_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'selecionar_conta_state.dart';
part 'selecionar_conta_event.dart';

class SelecionarContaBloc extends InternetBankingBlocBase<SelecionarContaEvent, SelecionarContaState> {
  final IAutenticacaoRepositorio _autenticacaoRepositorio;
  final GerenciadorUsuario _gerenciadorUsuario;

  SelecionarContaBloc({
    required IAutenticacaoRepositorio autenticacaoRepositorio,
    required GerenciadorUsuario gerenciadorUsuario,
  })  : _gerenciadorUsuario = gerenciadorUsuario,
        _autenticacaoRepositorio = autenticacaoRepositorio,
        super(SelecionarContaState(
          contas: gerenciadorUsuario.usuario!.empresaSelecionada!.contas!,
        )) {
    on<SelecionarContaEvent>(
      (event, emit) async {
        switch (event) {
          case SelecionarContaEventContaSelecionada():
            await _onSelecionarConta(event, emit);
          case SelecionarContaEventLogoff():
            await onLogoff(emit);
        }
      },
    );
  }

  @override
  Future<void> onIniciar(Emitter<SelecionarContaState> emit) async {}

  Future<void> _onSelecionarConta(
    SelecionarContaEventContaSelecionada evento,
    Emitter<SelecionarContaState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());

      SelecionarContaRequisicaoDTO requisicao = SelecionarContaRequisicaoDTO(
        cnpj: _gerenciadorUsuario.usuario!.empresaSelecionada!.cnpj,
        agencia: evento.contaSelecionada.agencia,
        numeroConta: evento.contaSelecionada.numeroConta,
        tipoConta: evento.contaSelecionada.tipoConta,
        titularidade: evento.contaSelecionada.titularidade,
      );
      await _autenticacaoRepositorio.selecionarConta(requisicao, _gerenciadorUsuario.usuario!.codigoSessao, true);

      _gerenciadorUsuario.registrarSelecaoConta(evento.contaSelecionada);

      emit(state.fecharModalProcessamento());
      emit(state.redirecionar(rotaDestino: InternetBankingRotas.home));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }
}
