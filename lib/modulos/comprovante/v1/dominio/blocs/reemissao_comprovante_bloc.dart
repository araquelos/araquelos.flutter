import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/comprovante_minificado_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_comprovantes_paginados_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/modelos/comprovante.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:path_provider/path_provider.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'package:share_plus/share_plus.dart';

part 'reemissao_comprovante_event.dart';
part 'reemissao_comprovante_state.dart';

class ReemissaoComprovanteBloc extends InternetBankingBlocBase<ReemissaoComprovanteEvent, ReemissaoComprovanteState> {
  final IComprovanteRepositorio comprovanteRepositorio;
  final GerenciadorUsuario gerenciadorUsuario;

  ReemissaoComprovanteBloc({
    required this.comprovanteRepositorio,
    required this.gerenciadorUsuario,
  }) : super(ReemissaoComprovanteState(
          etapa: null,
          listaTransacoes: null,
          listaTransacoesFiltrada: null,
          transacaoSelecionada: null,
          listaComprovantes: null,
          listaComprovantesFiltrada: null,
          comprovanteSelecionado: null,
          paginador: PaginadorDTO(pagina: 0, totalRegistros: 0, totalPaginas: 0, registrosPorPagina: 20),
        )) {
    on<ReemissaoComprovanteEvent>((evento, emit) async {
      switch (evento) {
        case ReeemissaoComprovanteEventIniciar():
          onIniciar(emit);
        case ReemissaoComprovanteEventAlterarFiltro():
          await _onFiltroTextoAlterado(evento, emit);
        case ReemissaoComprovanteEventSelecionarTransacao():
          await _onSelecionarTransacao(evento, emit);
        case ReemissaoComprovanteEventAvancarPagina():
          await _onAvancarPagina(emit);
        case ReemissaoComprovanteEventSelecionarComprovante():
          await _onSelecionarComprovante(evento, emit);
        case ReemissaoComprovanteEventCompartilharComprovante():
          await _onCompartilharComprovante(evento, emit);
        case ReemissaoComprovanteEventVoltar():
          await _onVoltar(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<ReemissaoComprovanteState> emit) async {
    try {
      List<TransacaoDTO> listaTransacoes = await comprovanteRepositorio.listarTransacoes();
      emit(state.copyWith(
        listaTransacoes: () => listaTransacoes,
        listaTransacoesFiltrada: () => listaTransacoes,
        etapa: () => EtapaReemissaoComprovante.exibirListaTransacoes,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onFiltroTextoAlterado(
    ReemissaoComprovanteEventAlterarFiltro evento,
    Emitter<ReemissaoComprovanteState> emit,
  ) async {
    if (state.etapa == EtapaReemissaoComprovante.exibirListaTransacoes) {
      emit(state.copyWith(
        listaTransacoesFiltrada: () =>
            state.listaTransacoes!.where((transacao) => transacao.descricao.contains(evento.filtro)).toList(),
      ));
    } else if (state.etapa == EtapaReemissaoComprovante.exibirListaComprovantes) {
      emit(state.copyWith(
        listaComprovantesFiltrada: () =>
            state.listaComprovantes!.where((comprovante) => comprovante.descricao.contains(evento.filtro)).toList(),
      ));
    }
  }

  Future<void> _onSelecionarTransacao(
    ReemissaoComprovanteEventSelecionarTransacao evento,
    Emitter<ReemissaoComprovanteState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());

      ObterComprovantesPaginadosRespostaDTO resultado = await comprovanteRepositorio.obterComprovantesPaginados(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        codigoTransacao: evento.transacaoSelecionada.codigo,
        paginador: state.paginador,
      );

      emit(state.fecharModalProcessamento());
      emit(state.copyWith(
        transacaoSelecionada: () => evento.transacaoSelecionada,
        listaComprovantes: () => resultado.lista,
        listaComprovantesFiltrada: () => resultado.lista,
        paginador: () => resultado.paginador,
        etapa: () => EtapaReemissaoComprovante.exibirListaComprovantes,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onAvancarPagina(Emitter<ReemissaoComprovanteState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      ObterComprovantesPaginadosRespostaDTO resposta = await comprovanteRepositorio.obterComprovantesPaginados(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        codigoTransacao: state.transacaoSelecionada!.codigo,
        paginador: state.paginador.proximaPagina(),
      );

      emit(state.copyWith(
        listaComprovantes: () => List.from(state.listaComprovantes!)..addAll(resposta.lista),
        listaComprovantesFiltrada: () => List.from(state.listaComprovantes!)..addAll(resposta.lista),
        paginador: () => resposta.paginador,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onSelecionarComprovante(
    ReemissaoComprovanteEventSelecionarComprovante evento,
    Emitter<ReemissaoComprovanteState> emit,
  ) async {
    try {
      Comprovante comprovante = Comprovante.gerarComprovante(evento.comprovanteSelecionado);

      emit(state.copyWith(
        comprovanteSelecionado: () => comprovante,
        etapa: () => EtapaReemissaoComprovante.exibirComprovante,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onCompartilharComprovante(
    ReemissaoComprovanteEventCompartilharComprovante evento,
    Emitter<ReemissaoComprovanteState> emit,
  ) async {
    try {
      RenderRepaintBoundary boundary = evento.globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 1.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List uint8list = byteData!.buffer.asUint8List();
      Directory tempDir = await getTemporaryDirectory();
      File file = File("${tempDir.path}/comprovante.png");
      await file.writeAsBytes(uint8list);
      Share.shareXFiles([XFile(file.path, mimeType: "image/png")]);
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onVoltar(Emitter<ReemissaoComprovanteState> emit) async {
    switch (state.etapa) {
      case null:
        emit(state.voltar());
      case EtapaReemissaoComprovante.exibirListaTransacoes:
        emit(state.voltar());
      case EtapaReemissaoComprovante.exibirListaComprovantes:
        emit(state.copyWith(
          etapa: () => EtapaReemissaoComprovante.exibirListaTransacoes,
          listaTransacoesFiltrada: () => state.listaTransacoes,
          transacaoSelecionada: () => null,
          listaComprovantes: () => null,
          paginador: () => PaginadorDTO(pagina: 0, totalRegistros: 0, totalPaginas: 0, registrosPorPagina: 20),
        ));
      case EtapaReemissaoComprovante.exibirComprovante:
        emit(state.copyWith(
          etapa: () => EtapaReemissaoComprovante.exibirListaComprovantes,
          listaComprovantesFiltrada: () => state.listaComprovantes,
          comprovanteSelecionado: () => null,
        ));
    }
  }
}
