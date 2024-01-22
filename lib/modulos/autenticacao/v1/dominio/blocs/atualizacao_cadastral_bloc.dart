import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/telefone_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/dados_cadastrais_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_multifatorial_enum.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'atualizacao_cadastral_state.dart';
part 'atualizacao_cadastral_event.dart';

class AtualizacaoCadastralBloc extends InternetBankingBlocBase<AtualizacaoCadastralEvent, AtualizacaoCadastralState> {
  IDadosCadastraisRepositorio dadosCadastraisRepositorio;

  GerenciadorUsuario gerenciadorUsuario;

  AtualizacaoCadastralBloc({
    required this.dadosCadastraisRepositorio,
    required this.gerenciadorUsuario,
  }) : super(AtualizacaoCadastralState(
          etapa: AtualizacaoCadastralEtapa.exibirAviso,
          dadosContato: gerenciadorUsuario.usuario!.dadosContato,
          assinatura: null,
          tempoValidade: null,
        )) {
    on<AtualizacaoCadastralEvent>((evento, emit) async {
      switch (evento) {
        case EventoIrParaAviso():
          await _onIrParaAviso(emit);
        case EventoIrParaAtualizarContatos():
          await _onIrParaAtualizarContatos(evento, emit);
        case EventoEnviarSMSToken():
          await _onEnviarSMSToken(emit);
        case EventoConfirmarCodigo():
          await _onConfirmarCodigo(evento, emit);
        case EventoSolicitarChamada():
          await _onSolicitarChamada(evento, emit);
        case EventoReenviarSMS():
          await _onEnviarSMSToken(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<AtualizacaoCadastralState> emit) async {}

  Future<void> _onIrParaAviso(
    Emitter<AtualizacaoCadastralState> emit,
  ) async {
    emit(state.copyWith(etapa: () => AtualizacaoCadastralEtapa.exibirAviso));
  }

  Future<void> _onIrParaAtualizarContatos(
    EventoIrParaAtualizarContatos evento,
    Emitter<AtualizacaoCadastralState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => AtualizacaoCadastralEtapa.exibirFormularioAtualizacao,
    ));
  }

  Future<void> _onEnviarSMSToken(
    Emitter<AtualizacaoCadastralState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());

      var resultado = await dadosCadastraisRepositorio.iniciarAtualizacaoCadastral(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        tipoAutenticacaoMultifatorial: TipoAutenticacaoMultifatorialEnum.sms,
        modelo: state.dadosContato!.copyWith(
          telefone: TelefoneDTO(ddd: "91", numero: "984343063"),
        ),
      );

      emit(state.fecharModalProcessamento());
      emit(state.copyWith(
        etapa: () => AtualizacaoCadastralEtapa.exibirInserirToken,
        assinatura: () => resultado.assinatura,
        tempoValidade: () => resultado.tempoValidade,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onConfirmarCodigo(
    EventoConfirmarCodigo evento,
    Emitter<AtualizacaoCadastralState> emit,
  ) async {
    throw UnimplementedError();
  }

  Future<void> _onSolicitarChamada(
    EventoSolicitarChamada evento,
    Emitter<AtualizacaoCadastralState> emit,
  ) async {
    throw UnimplementedError();
  }
}
