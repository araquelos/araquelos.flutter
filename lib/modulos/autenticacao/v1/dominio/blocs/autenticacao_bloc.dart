import 'package:flutter/material.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/formularios/autenticacao_formulario.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/conta_salva.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:mobile_pj/utils/servicos/digital_servico.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_servico.dart';
import 'package:mobile_pj/utils/servicos/gerenciar_conta_servico.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'autenticacao_event.dart';
part 'autenticacao_state.dart';

class AutenticacaoBloc extends InternetBankingBlocBase<AutenticacaoEvent, AutenticacaoState> {
  IAutenticacaoRepositorio autenticacaoRepositorio;
  DispositivoServico dispositivoServico;
  DigitalServico digitalServico;
  GerenciadorUsuario gerenciadorUsuario;

  GerenciarContaServico? gerenciarContaServico;

  AutenticacaoBloc({
    required this.autenticacaoRepositorio,
    required this.dispositivoServico,
    required this.digitalServico,
    required this.gerenciadorUsuario,
  }) : super(AutenticacaoState(
          etapa: null,
          dispositivoPossuiBiometria: false,
          ultimaContaAcessada: null,
          listaContasSalvas: null,
        )) {
    on<AutenticacaoEvent>((evento, emit) async {
      switch (evento) {
        case AutenticacaoEventIniciar():
          await onIniciar(emit);
        case AutenticacaoEventListarContasSalvas():
          await _onListarContasSalvas(evento, emit);
        case AutenticacaoEventSelecionarContaSalva():
          await _onSelecionarContaSalva(evento, emit);
        case AutenticacaoEventExcluirContaSalva():
          await _onExcluirContaSalva(evento, emit);
        case AutenticacaoEventEntrarNovaConta():
          await _onEntrarNovaConta(evento, emit);
        case AutenticacaoEventAutenticar():
          await _onAutenticar(evento, emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<AutenticacaoState> emit) async {
    try {
      gerenciarContaServico ??= await fabrica.getAsync<GerenciarContaServico>();
      ContaSalva? ultimaContaAcessada = gerenciarContaServico!.obterUltimaContaAcessada();
      List<ContaSalva>? listaContasSalvas = gerenciarContaServico!.listarContasSalvas();
      if (listaContasSalvas != null) {
        listaContasSalvas.add(listaContasSalvas[0]);
        listaContasSalvas.add(listaContasSalvas[0]);
        listaContasSalvas.add(listaContasSalvas[0]);
      }

      bool dispositivoPossuiBiometria = await digitalServico.podeAutenticar();

      if (ultimaContaAcessada == null) {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirAutenticacaoNovaConta,
          dispositivoPossuiBiometria: () => dispositivoPossuiBiometria,
          listaContasSalvas: () => listaContasSalvas,
          ultimaContaAcessada: () => ultimaContaAcessada,
        ));
      } else {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirAutenticacaoContaSalva,
          dispositivoPossuiBiometria: () => dispositivoPossuiBiometria,
          listaContasSalvas: () => listaContasSalvas,
          ultimaContaAcessada: () => ultimaContaAcessada,
        ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onListarContasSalvas(
    AutenticacaoEventListarContasSalvas evento,
    Emitter<AutenticacaoState> emit,
  ) async {
    try {
      if (state.listaContasSalvas != null && state.listaContasSalvas!.length > 1) {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirListaContasSalvas,
        ));
      } else {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirAutenticacaoNovaConta,
        ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onSelecionarContaSalva(
    AutenticacaoEventSelecionarContaSalva evento,
    Emitter<AutenticacaoState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => AutenticacaoEtapa.exibirAutenticacaoContaSalva,
      ultimaContaAcessada: () => evento.contaSelecionada,
    ));
  }

  Future<void> _onExcluirContaSalva(
    AutenticacaoEventExcluirContaSalva evento,
    Emitter<AutenticacaoState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());
      await gerenciarContaServico!.removerConta(evento.contaSelecionada);
      ContaSalva? ultimaContaAcessada = gerenciarContaServico!.obterUltimaContaAcessada();
      List<ContaSalva>? listaContasSalvas = gerenciarContaServico!.listarContasSalvas();

      await Future.delayed(const Duration(seconds: 2));
      emit(state.fecharModalProcessamento());

      if (listaContasSalvas != null) {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirListaContasSalvas,
          ultimaContaAcessada: () => ultimaContaAcessada,
          listaContasSalvas: () => listaContasSalvas,
        ));
      } else {
        emit(state.copyWith(
          etapa: () => AutenticacaoEtapa.exibirAutenticacaoNovaConta,
          ultimaContaAcessada: () => ultimaContaAcessada,
          listaContasSalvas: () => listaContasSalvas,
        ));
      }
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onEntrarNovaConta(
    AutenticacaoEventEntrarNovaConta evento,
    Emitter<AutenticacaoState> emit,
  ) async {
    emit(state.copyWith(
      etapa: () => AutenticacaoEtapa.exibirAutenticacaoNovaConta,
    ));
  }

  Future<void> _onAutenticar(
    AutenticacaoEventAutenticar evento,
    Emitter<AutenticacaoState> emit,
  ) async {
    try {
      if (evento.formulario.usarDigital) {
        if (!await digitalServico.autenticar()) return;
      }

      emit(state.exibirModalProcessamento());

      AutenticarRequisicaoDTO requisicao = AutenticarRequisicaoDTO(
        cpf: evento.formulario.cpf!.replaceAll(RegExp('[^A-Za-z0-9]'), ''),
        senha: evento.formulario.senha!,
        dispositivo: await dispositivoServico.getInfoDispositivo(),
      );

      AutenticarRespostaDTO usuarioAutenticado = await autenticacaoRepositorio.autenticar(requisicao);

      gerenciadorUsuario.registrarLogin(usuarioAutenticado);

      gerenciarContaServico!.salvarConta(ContaSalva(
        cpf: usuarioAutenticado.cpf,
        nome: usuarioAutenticado.nome,
        empresas: usuarioAutenticado.empresas,
        nomeDispositivo: usuarioAutenticado.dispositivo.nome,
        senha: evento.formulario.usarDigital ? requisicao.senha : null,
        dispositivoGeradorToken: false,
        autenticarComDigital: evento.formulario.usarDigital,
      ));

      emit(state.fecharModalProcessamento());
      emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }
}
