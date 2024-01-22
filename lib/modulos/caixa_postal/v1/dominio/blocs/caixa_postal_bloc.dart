import 'package:flutter/material.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_requisicao_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/mensagem_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'caixa_postal_state.dart';
part 'caixa_postal_event.dart';

class CaixaPostalBloc extends InternetBankingBlocBase<CaixaPostalEvent, CaixaPostalState> {
  ICaixaPostalRepositorio caixaPostalRepositorio;
  GerenciadorUsuario gerenciadorUsuario;

  CaixaPostalBloc({required this.caixaPostalRepositorio, required this.gerenciadorUsuario})
      : super(CaixaPostalState(
          etapa: null,
          listaMensagens: null,
          mensagemSelecionada: null,
          listaMensagensSelecionadas: [],
          mensagemLida: null,
        )) {
    on<CaixaPostalEvent>((evento, emit) async {
      switch (evento) {
        case CaixaPostalEventIniciar():
          await onIniciar(emit);
        case CaixaPostalEventMarcarMensagemComoLida():
          await onMarcarMensagemComoLida(evento, emit);
        case CaixaPostalEventExcluirMensagem():
          await onExcluirMensagem(evento, emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<CaixaPostalState> emit) async {
    try {
      List<MensagemDTO> listaMensagens =
          await caixaPostalRepositorio.obterMensagens(codigoSessao: gerenciadorUsuario.usuario!.codigoSessao);

      emit(state.copyWith(
        etapa: () => CaixaPostalEtapa.exibirListaMensagens,
        listaMensagem: () => listaMensagens,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> onMarcarMensagemComoLida(
      CaixaPostalEventMarcarMensagemComoLida evento, Emitter<CaixaPostalState> emit) async {
    try {
      emit(state.exibirModalProcessamento());
      await caixaPostalRepositorio.marcarMensagemComoLida(
          codigoSessao: gerenciadorUsuario.usuario!.codigoSessao, idMensagem: evento.mensagemSelecionada.id);
      emit(state.fecharModalProcessamento());
      emit(state.copyWith(
          etapa: () => CaixaPostalEtapa.aguardandoFimRequisicao,
          mensagemSelecionada: () => evento.mensagemSelecionada));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> onExcluirMensagem(CaixaPostalEventExcluirMensagem evento, Emitter<CaixaPostalState> emit) async {
    try {
      emit(state.exibirModalProcessamento());
      await caixaPostalRepositorio.excluirMensagens(
          codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
          modelo: ExcluirMensagensRequisicaoDTO(idsMensagens: evento.idsMensagens));

      emit(state.fecharModalProcessamento());
      emit(state.copyWith(etapa: () => CaixaPostalEtapa.exibirListaMensagens));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }
}
