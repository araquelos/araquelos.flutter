import 'package:flutter/material.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'selecionar_empresa_state.dart';
part 'selecionar_empresa_event.dart';

class SelecionarEmpresaBloc extends InternetBankingBlocBase<SelecionarEmpresaEvent, SelecionarEmpresaState> {
  IAutenticacaoRepositorio autenticacaoRepositorio;
  GerenciadorUsuario gerenciadorUsuario;

  SelecionarEmpresaBloc({
    required this.autenticacaoRepositorio,
    required this.gerenciadorUsuario,
  }) : super(SelecionarEmpresaState(
          empresas: gerenciadorUsuario.usuario!.empresas,
        )) {
    on<SelecionarEmpresaEvent>(
      (event, emit) async {
        switch (event) {
          case SelecionarEmpresaEventEmpresaSelecionada():
            await _onSelecionarEmpresa(event, emit);
          case SelecionarEmpresaEventLogoff():
            await onLogoff(emit);
        }
      },
    );
  }

  @override
  Future<void> onIniciar(Emitter<SelecionarEmpresaState> emit) async {}

  Future<void> _onSelecionarEmpresa(
    SelecionarEmpresaEventEmpresaSelecionada evento,
    Emitter<SelecionarEmpresaState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());
      var detalharEmpresa = await autenticacaoRepositorio.detalharEmpresa(
        gerenciadorUsuario.usuario!.codigoSessao,
        evento.empresaSelecionada.cnpj,
      );

      gerenciadorUsuario.registrarSelecaoEmpresa(evento.empresaSelecionada.copyWith(
        dadosMultifatorial: detalharEmpresa.multifatorialEmpresaUsuario,
        contas: detalharEmpresa.contas,
      ));

      emit(state.fecharModalProcessamento());
      emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }
}
