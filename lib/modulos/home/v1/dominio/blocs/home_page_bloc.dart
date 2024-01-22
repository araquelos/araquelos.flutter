import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/obter_quantidade_mensagens_nao_lidas_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'home_page_state.dart';
part 'home_page_event.dart';

class HomePageBloc extends InternetBankingBlocBase<HomePageEvent, HomePageState> {
  final ICaixaPostalRepositorio caixaPostalRepositorio;
  final GerenciadorUsuario gerenciadorUsuario;

  HomePageBloc({
    required this.caixaPostalRepositorio,
    required this.gerenciadorUsuario,
  }) : super(HomePageState(
          indicadorVisibilidadePublicidade: true,
          indicadorPossuiMensagensNaoLidas: false,
          quantidadeMensagensNaoLidas: 0,
        )) {
    on<HomePageEvent>((evento, emit) async {
      switch (evento) {
        case HomePageEventIniciar():
          await onIniciar(emit);
        case EventoIrParaAssinaturas():
          await _onIrParaAssinaturas(evento, emit);
        case EventoAlternarVisibilidadePublicidade():
          await _onAlternarVisibilidadePublicidade(evento, emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<HomePageState> emit) async {
    ObterQuantidadeMensagensNaoLidasDTO resposta = await caixaPostalRepositorio.obterQuantidadeMensagensNaoLidas(
      codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
    );

    emit(state.copyWith(
      quantidadeMensagensNaoLidas: () => resposta.valor,
      indicadorPossuiMensagensNaoLidas: () => resposta.valor > 0,
    ));
  }

  Future<void> _onIrParaAssinaturas(EventoIrParaAssinaturas evento, Emitter<HomePageState> emit) async {
    emit(state.redirecionar(
      rotaDestino: InternetBankingRotas.assinatura,
      parametros: {"filtro": evento.filtro.name},
    ));
  }

  Future<void> _onAlternarVisibilidadePublicidade(
    EventoAlternarVisibilidadePublicidade evento,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
      indicadorVisibilidadePublicidade: () => !state.indicadorVisibilidadePublicidade,
    ));
  }
}
