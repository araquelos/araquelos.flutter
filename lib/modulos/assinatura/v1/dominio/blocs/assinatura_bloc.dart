import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/assinar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/cancelar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_paginadas_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_requisicao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_assinatura_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_detalhada_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_minificada_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/interface/assinatura_repositorio.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_assinatura_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_dado_operacao_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/modelos/operacao_revisao.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_xml_por_operacao_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'assinatura_event.dart';
part 'assinatura_state.dart';

class AssinaturaBloc extends InternetBankingBlocBase<AssinaturaEvent, AssinaturaState> {
  IAssinaturaRepositorio assinaturaRepositorio;
  IComprovanteRepositorio comprovanteRepositorio;
  GerenciadorUsuario gerenciadorUsuario;

  AssinaturaBloc({
    required this.assinaturaRepositorio,
    required this.comprovanteRepositorio,
    required this.gerenciadorUsuario,
    required String parametroFiltro,
  }) : super(AssinaturaState(
          etapa: null,
          filtro: FiltroAssinaturaTipoTransacaoEnum.values.byName(parametroFiltro),
          paginador: PaginadorDTO(pagina: 0, totalRegistros: 0, totalPaginas: 0, registrosPorPagina: 20),
          listaOperacoes: [],
          operacaoSelecionada: null,
          operacaoRevisao: null,
        )) {
    on<AssinaturaEvent>((evento, emit) async {
      switch (evento) {
        case AssinaturaEventIniciar():
          await onIniciar(emit);
        case AssinaturaEventSelecionarOperacao():
          await _onSelecionarOperacao(evento, emit);
        case AssinaturaEventAvancarPagina():
          await _onAvancarPagina(evento, emit);
        case AssinaturaEventAssinar():
          await _onAssinarOperacao(evento, emit);
        case AssinaturaEventCancelar():
          await _onCancelarOperacao(evento, emit);
        case AssinaturaEventMudarFiltro():
          await _onMudarFiltro(evento, emit);
        case AssinaturaEventVoltar():
          await _onVoltar(emit);
        case AssinaturaEventLogoff():
          await onLogoff(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<AssinaturaState> emit) async {
    try {
      ListarOperacoesRequisicaoDTO requisicao = ListarOperacoesRequisicaoDTO(
        filtro: FiltroAssinaturaTipoTransacaoEnum.pendentes,
        paginador: state.paginador,
      );

      ListarOperacoesPaginadasRespostaDTO resposta = await assinaturaRepositorio.listarOperacoesPaginadas(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        corpoRequisicao: requisicao,
      );

      emit(state.copyWith(
        etapa: () => AssinaturaEtapa.exibirListaOperacoes,
        listaOperacoes: () => resposta.lista,
        paginador: () => resposta.paginador,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onSelecionarOperacao(AssinaturaEventSelecionarOperacao evento, Emitter<AssinaturaState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      OperacaoDetalhadaRespostaDTO resposta = await assinaturaRepositorio.consultarOperacao(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        idOperacao: evento.operacaoSelecionada.id,
      );

      OperacaoRevisao operacaoRevisao = OperacaoRevisao(
        pendenteAssinaturaUsuarioLogado: !resposta.assinaturas.any(
          (assinatura) => assinatura.cpfUsuario == gerenciadorUsuario.usuario!.cpf,
        ),
      );

      for (var item in resposta.dados) {
        if (item.tipo == TipoDadoOperacaoEnum.label) {
          operacaoRevisao.lista.add(OperacaoGrupo(titulo: item.chave));
          continue;
        } else if (item.tipo == TipoDadoOperacaoEnum.info) {
          operacaoRevisao.lista[operacaoRevisao.lista.length - 1].lista.add({item.chave: item.valor!});
        } else {
          continue;
        }
      }

      emit(state.fecharModalProcessamento());

      emit(state.copyWith(
        etapa: () => AssinaturaEtapa.exibirDetalheOperacao,
        operacaoSelecionada: () => resposta,
        operacaoRevisao: () => operacaoRevisao,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onAvancarPagina(AssinaturaEventAvancarPagina evento, Emitter<AssinaturaState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      ListarOperacoesPaginadasRespostaDTO resposta = await assinaturaRepositorio.listarOperacoesPaginadas(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        corpoRequisicao: ListarOperacoesRequisicaoDTO(
          filtro: state.filtro!,
          paginador: state.paginador.proximaPagina(),
        ),
      );

      emit(state.copyWith(
        listaOperacoes: () => List.from(state.listaOperacoes)..addAll(resposta.lista),
        paginador: () => resposta.paginador,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onMudarFiltro(AssinaturaEventMudarFiltro evento, Emitter<AssinaturaState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      ListarOperacoesRequisicaoDTO requisicao = ListarOperacoesRequisicaoDTO(
        filtro: evento.filtro,
        paginador: PaginadorDTO(
          pagina: 0,
          totalPaginas: 0,
          totalRegistros: 0,
          registrosPorPagina: 20,
        ),
      );

      ListarOperacoesPaginadasRespostaDTO resposta = await assinaturaRepositorio.listarOperacoesPaginadas(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        corpoRequisicao: requisicao,
      );

      emit(state.fecharModalProcessamento());
      emit(state.copyWith(
        etapa: () => AssinaturaEtapa.exibirListaOperacoes,
        filtro: () => evento.filtro,
        listaOperacoes: () => resposta.lista,
        paginador: () => resposta.paginador,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onAssinarOperacao(AssinaturaEventAssinar evento, Emitter<AssinaturaState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      await Future.delayed(const Duration(seconds: 3));

      await assinaturaRepositorio.permiteAssinar(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        idOperacao: evento.idOperacao,
      );

      AssinarResponseDTO status = await assinaturaRepositorio.assinar(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        idOperacao: evento.idOperacao,
      );

      emit(state.fecharModalProcessamento());

      OperacaoRevisao operacaoRevisao = state.operacaoRevisao!;
      operacaoRevisao.pendenteAssinaturaUsuarioLogado = false;

      emit(
        state.copyWith(
          operacaoSelecionada: () => state.operacaoSelecionada!.copyWith(
            assinaturas: List.from(state.operacaoSelecionada!.assinaturas)
              ..add(
                OperacaoAssinaturaDTO(
                  cpfUsuario: gerenciadorUsuario.usuario!.cpf,
                  nomeUsuario: gerenciadorUsuario.usuario!.nome,
                  tipoAssinatura: TipoAssinaturaEnum.assinatura,
                  dataHoraRegistro: DateTime.now(),
                ),
              ),
            assinaturasEfetuadas: state.operacaoSelecionada!.assinaturasEfetuadas + 1,
          ),
          operacaoRevisao: () => operacaoRevisao,
        ),
      );

      switch (status.valor) {
        case StatusOperacaoEnum.pendente:
        case StatusOperacaoEnum.cancelada:
        case StatusOperacaoEnum.aguardandoExecucao:
          emit(state.copyWith(
            operacaoSelecionada: () => state.operacaoSelecionada!.copyWith(
              status: status.valor,
            ),
          ));
        case StatusOperacaoEnum.executado:
          ObterXmlPorOperacaoRespostaDTO comprovante = await comprovanteRepositorio.obterXmlPorOperacao(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            idOperacao: state.operacaoSelecionada!.id,
            ehReemissao: false,
          );

          emit(
            state.redirecionar(
              rotaDestino: InternetBankingRotas.comprovante,
              parametros: {'xml': comprovante.valor},
            ),
          );
        case StatusOperacaoEnum.erroExecucao:
          emit(state.exibirModalErro(
            tituloMensagem: "Erro de execução",
            mensagem: "Ocorreu um erro durante a execução desta operação.",
          ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onCancelarOperacao(AssinaturaEventCancelar evento, Emitter<AssinaturaState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      await assinaturaRepositorio.permiteCancelar(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        idOperacao: evento.idOperacao,
      );

      CancelarResponseDTO status = await assinaturaRepositorio.cancelar(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        idOperacao: evento.idOperacao,
      );

      emit(state.fecharModalProcessamento());

      emit(
        state.copyWith(
          operacaoSelecionada: () => state.operacaoSelecionada!.copyWith(
            assinaturas: List.from(state.operacaoSelecionada!.assinaturas)
              ..add(
                OperacaoAssinaturaDTO(
                  cpfUsuario: gerenciadorUsuario.usuario!.cpf,
                  nomeUsuario: gerenciadorUsuario.usuario!.nome,
                  tipoAssinatura: TipoAssinaturaEnum.cancelamento,
                  dataHoraRegistro: DateTime.now(),
                ),
              ),
            assinaturasEfetuadas: state.operacaoSelecionada!.assinaturasEfetuadas + 1,
          ),
        ),
      );

      switch (status.valor) {
        case StatusOperacaoEnum.pendente:
        case StatusOperacaoEnum.cancelada:
        case StatusOperacaoEnum.aguardandoExecucao:
          emit(state.copyWith(
            operacaoSelecionada: () => state.operacaoSelecionada!.copyWith(
              status: status.valor,
            ),
          ));
        case StatusOperacaoEnum.executado:
          ObterXmlPorOperacaoRespostaDTO comprovante = await comprovanteRepositorio.obterXmlPorOperacao(
            codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
            idOperacao: state.operacaoSelecionada!.id,
            ehReemissao: false,
          );

          emit(
            state.redirecionar(
              rotaDestino: InternetBankingRotas.comprovante,
              parametros: {'xml': comprovante.valor},
            ),
          );
        case StatusOperacaoEnum.erroExecucao:
          emit(state.exibirModalErro(
            tituloMensagem: "Erro de execução",
            mensagem: "Ocorreu um erro durante a execução desta operação.",
          ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onVoltar(Emitter<AssinaturaState> emit) async {
    switch (state.etapa) {
      case null:
      case AssinaturaEtapa.exibirListaOperacoes:
        emit(state.voltar());
      case AssinaturaEtapa.exibirDetalheOperacao:
        emit(state.copyWith(
          etapa: () => AssinaturaEtapa.exibirListaOperacoes,
          operacaoSelecionada: () => null,
          operacaoRevisao: () => null,
        ));
    }
  }
}
