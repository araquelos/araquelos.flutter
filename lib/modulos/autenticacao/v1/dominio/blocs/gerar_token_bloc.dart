import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/conta_token.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/empresa_token.dart';

part 'gerar_token_state.dart';
part 'gerar_token_event.dart';

class GerarTokenBloc extends Bloc<GerarTokenEvent, GerarTokenState> {
  GerarTokenBloc()
      : super(GerarTokenState(
          etapa: null,
          empresaSelecionada: null,
          contaSelecionada: null,
          token: null,
          duracaoToken: null,
        )) {
    on<GerarTokenEvent>((evento, emit) async {
      switch (evento) {
        case GerarTokenEventEmpresaSelecionada():
          await _onGerarTokenEmpresaSelecionada(evento, emit);
        case GerarTokenEventCpfSelecionado():
          await _onGerarTokenCpfSelecionado(evento, emit);
        case GerarTokenEventDisparar():
          await _onGerarTokenDisparar(evento, emit);
      }
    });
  }

  Future<void> _onGerarTokenEmpresaSelecionada(
    GerarTokenEventEmpresaSelecionada evento,
    Emitter<GerarTokenState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => GerarTokenEtapa.empresaSelecionada,
      empresaSelecionada: () =>
          evento.empresaSelecionada == state.empresaSelecionada ? null : evento.empresaSelecionada,
    ));
  }

  Future<void> _onGerarTokenCpfSelecionado(
    GerarTokenEventCpfSelecionado evento,
    Emitter<GerarTokenState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => GerarTokenEtapa.contaSelecionada,
      contaSelecionada: () => evento.contaSelecionada,
    ));
  }

  Future<void> _onGerarTokenDisparar(
    GerarTokenEventDisparar evento,
    Emitter<GerarTokenState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => GerarTokenEtapa.processando,
    ));
    await Future.delayed(const Duration(milliseconds: 1500));
    String tokenGerado = (111111 + Random().nextInt(999999 - 111111)).toString();
    emit(state.copyWith(
      etapa: () => GerarTokenEtapa.tokenGerado,
      token: () => tokenGerado,
      duracaoToken: () => 5,
    ));
  }
}
