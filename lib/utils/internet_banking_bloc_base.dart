import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/http/excecoes/erro_infraestrutura_excecao.dart';
import 'package:mobile_pj/utils/http/excecoes/erro_negocio_excecao.dart';
import 'package:replay_bloc/replay_bloc.dart';

abstract class InternetBankingBlocBase<Evento extends ReplayEvent, Estado extends IEstadoBase<Estado>>
    extends ReplayBloc<Evento, Estado> {
  InternetBankingBlocBase(Estado state, {int? limit}) : super(state, limit: limit);

  @protected
  Future<void> onIniciar(Emitter<Estado> emit);

  @protected
  Future<void> onLogoff(Emitter<Estado> emit) async {
    fabrica<GerenciadorUsuario>().logoff();
    emit(state.redirecionar(
      rotaDestino: InternetBankingRotas.autenticacao,
    ));
  }

  @protected
  void gerenciarExcecao({required Exception excecao, required Emitter<Estado> emit}) {
    if (excecao is ErroNegocioExcecao) {
      log("Erro de negócio detectado no bloc: ${excecao.mensagem}");
      emit(state.fecharModalProcessamento());
      emit(state.exibirModalErro(
        mensagem: "${excecao.mensagem}",
      ));
    } else if (excecao is ErroInfraestruturaExcecao) {
      log("Erro de infraestrutura detectado no bloc: ${excecao.mensagem}");
      emit(state.fecharModalProcessamento());
      emit(state.exibirModalErro(
        mensagem: "${excecao.mensagem}",
      ));
    } else {
      log("Erro não identificado detectado no bloc: ${excecao.toString()}");
      emit(state.fecharModalProcessamento());
      emit(state.exibirModalErro(
        mensagem: "Erro não identificado: ${excecao.toString()}",
      ));
    }
  }

  @protected
  void gerenciarExcecaoNaoIntrusiva({required Exception excecao}) {
    // TODO Registrar exceção na ferramenta de crashlytics
  }
}
