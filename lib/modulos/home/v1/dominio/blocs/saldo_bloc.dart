import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_corrente_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_request_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/enum/tipo_conta_poupanca_enum.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'saldo_event.dart';
part 'saldo_state.dart';

class SaldoBloc extends InternetBankingBlocBase<SaldoEvent, SaldoState> {
  final ISaldoRepositorio saldoRespositorio;
  final GerenciadorUsuario gerenciadorUsuario;

  SaldoBloc({
    required this.saldoRespositorio,
    required this.gerenciadorUsuario,
  }) : super(SaldoState(
          indicadorVisibilidade: false,
          saldoDisponivelSaque: null,
          saldoTotal: null,
          saldoContaCorrente: null,
          saldoContaPoupanca: null,
        )) {
    on<SaldoEvent>(
      (event, emit) async {
        switch (event) {
          case SaldoEventAlternarVisibilidade():
            await _onAlternarVisibilidade(emit);
          case SaldoEventDetalharSaldo():
            await _onDetalharSaldo(emit);
          case SaldoEventFecharDetalhamentoSaldo():
            await _onFecharDetalhamentoSaldo(emit);
        }
      },
    );
  }

  @override
  Future<void> onIniciar(Emitter<SaldoState> emit) async {}

  Future<void> _onAlternarVisibilidade(Emitter<SaldoState> emit) async {
    try {
      if (state.indicadorVisibilidade) {
        emit(state.copyWith(
          indicadorVisibilidade: () => false,
        ));
        return;
      }

      emit(state.exibirModalProcessamento());

      switch (gerenciadorUsuario.usuario!.empresaSelecionada!.contaSelecionada!.tipoConta) {
        case TipoContaEnum.contaCorrente:
          SaldoContaCorrenteResponseDTO resposta = await saldoRespositorio.buscarSaldoContaCorrente(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            auditar: false,
          );
          emit(state.fecharModalProcessamento());
          emit(state.copyWith(
            indicadorVisibilidade: () => true,
            saldoTotal: () => resposta.saldoTotal,
            saldoDisponivelSaque: () => resposta.saldoDisponivelSaque,
            saldoContaCorrente: () => null,
            etapa: () => null,
          ));
        case TipoContaEnum.contaPoupanca:
          SaldoContaPoupancaResponseDTO resposta = await saldoRespositorio.buscarSaldoContaPoupanca(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            auditar: false,
            corpo: const SaldoContaPoupancaRequestDTO(tipoContaPoupanca: TipoContaPoupanca.nova),
          );
          emit(state.fecharModalProcessamento());
          emit(state.copyWith(
            indicadorVisibilidade: () => true,
            saldoTotal: () => resposta.saldoTotal,
            saldoDisponivelSaque: () => resposta.saldoDisponivelSaque,
            saldoContaPoupanca: () => null,
            etapa: () => null,
          ));
      }
    } on Exception catch (ex) {
      gerenciarExcecaoNaoIntrusiva(excecao: ex);
      emit(state.exibirModalErro(mensagem: "Erro no processamento"));
    }
  }

  Future<void> _onDetalharSaldo(Emitter<SaldoState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      switch (gerenciadorUsuario.usuario!.empresaSelecionada!.contaSelecionada!.tipoConta) {
        case TipoContaEnum.contaCorrente:
          SaldoContaCorrenteResponseDTO resposta = await saldoRespositorio.buscarSaldoContaCorrente(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            auditar: true,
          );
          emit(state.fecharModalProcessamento());
          emit(state.copyWith(
            saldoContaCorrente: () => resposta,
            etapa: () => SaldoEtapa.detalharSaldoContaCorrente,
          ));
        case TipoContaEnum.contaPoupanca:
          SaldoContaPoupancaResponseDTO resposta = await saldoRespositorio.buscarSaldoContaPoupanca(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            auditar: true,
            corpo: const SaldoContaPoupancaRequestDTO(tipoContaPoupanca: TipoContaPoupanca.nova),
          );
          emit(state.fecharModalProcessamento());
          emit(state.copyWith(
            saldoContaPoupanca: () => resposta,
            etapa: () => SaldoEtapa.detalharSaldoContaPoupanca,
          ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onFecharDetalhamentoSaldo(Emitter<SaldoState> emit) async {
    emit(state.copyWith(
      etapa: () => null,
    ));
  }
}
