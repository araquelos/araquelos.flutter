import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/renomear_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/gerenciar_dispositivo_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_servico.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'cadastrar_dispositivo_event.dart';
part 'cadastrar_dispositivo_state.dart';

class CadastrarDispositivoBloc extends InternetBankingBlocBase<CadastrarDispositivoEvent, CadastrarDispositivoState> {
  DispositivoServico dispositivoServico;
  GerenciadorUsuario gerenciadorUsuario;
  IMultifatorialServico multifatorialServico;
  IGerenciarDispositivoRepositorio gerenciarDispositivoRepositorio;

  CadastrarDispositivoBloc({
    required this.dispositivoServico,
    required this.gerenciadorUsuario,
    required this.multifatorialServico,
    required this.gerenciarDispositivoRepositorio,
  }) : super(CadastrarDispositivoState(
          etapa: null,
          nomeDispositivo: null,
          mensagemErroMultifatorial: null,
        )) {
    on<CadastrarDispositivoEvent>((evento, emit) async {
      switch (evento) {
        case EventoIniciar():
          await onIniciar(emit);
        case EventoIrParaNomearDispositivo():
          await _onIrParaNomearDispositivo(evento, emit);
        case EventoIrParaAviso():
          await _onIrParaAviso(emit);
        case EventoDefinirNome():
          await _onDefinirNome(evento, emit);
        case EventoIrParaGuiaHabilitacao():
          await _onIrParaGuiaHabilitacao(emit);
        case EventoFinalizar():
          await _onFinalizar(emit);
        case EventoLogoff():
          await onLogoff(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<CadastrarDispositivoState> emit) async {
    if (gerenciadorUsuario.usuario!.dispositivo.indicadorNovo) {
      emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAviso));
      return;
    }

    if (gerenciadorUsuario.obterStatusDispositivo() == StatusDispositivoEnum.naoAssociado ||
        gerenciadorUsuario.obterStatusDispositivo() == StatusDispositivoEnum.expirado) {
      emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAviso));
      await _associarIdentificadorMultifatorial(emit);
      return;
    }

    if (!gerenciadorUsuario.usuario!.empresaSelecionada!.dadosMultifatorial!.existeDispositivoHabilitado) {
      if (!gerenciadorUsuario.usuario!.empresaSelecionada!.dadosMultifatorial!.dataLimiteOtpExpirado) {
        emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAvisoPrimeiraHabilitacao));
      } else {
        emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAvisoOTPExpirado));
      }
    } else {
      emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAvisoNovaHabilitacao));
    }
  }

  Future<void> _onIrParaAviso(Emitter<CadastrarDispositivoState> emit) async {
    emit(state.copyWith(etapa: () => CadastrarDispositivoEtapa.exibirAviso));
  }

  Future<void> _onIrParaNomearDispositivo(
    EventoIrParaNomearDispositivo evento,
    Emitter<CadastrarDispositivoState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());
      var infoDispositivo = await dispositivoServico.getInfoDispositivo();
      emit(state.fecharModalProcessamento());
      emit(state.copyWith(
        etapa: () => CadastrarDispositivoEtapa.exibirNomearDispositivo,
        nomeDispositivo: () => infoDispositivo.nome,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onDefinirNome(
    EventoDefinirNome evento,
    Emitter<CadastrarDispositivoState> emit,
  ) async {
    try {
      emit(state.exibirModalProcessamento());
      var infoDispositivo = await dispositivoServico.getInfoDispositivo();

      RenomearRequisicaoDTO requisicao = RenomearRequisicaoDTO(
        canal: "APJ",
        id: gerenciadorUsuario.usuario!.dispositivo.id,
        nome: evento.nomeDispositivo,
        sistemaOperacional: "Android",
        marca: infoDispositivo.marca,
        modelo: infoDispositivo.modelo,
        ipUltimoAcesso: null,
        dataHoraUltimoAcesso: DateTime.now(),
        indicadorNovo: gerenciadorUsuario.usuario!.dispositivo.indicadorNovo,
      );

      await gerenciarDispositivoRepositorio.renomear(
        codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
        modelo: requisicao,
      );

      gerenciadorUsuario.registrarDispositivoRenomeado();

      emit(state.fecharModalProcessamento());
      await _associarIdentificadorMultifatorial(emit);
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
      gerenciadorUsuario.registrarErroMultifatorial();
      emit(state.copyWith(
        etapa: () => CadastrarDispositivoEtapa.exibirErroCadastroMultifatorial,
        mensagemErroMultifatorial: () => ex.toString(),
      ));
    }
  }

  Future<void> _associarIdentificadorMultifatorial(Emitter<CadastrarDispositivoState> emit) async {
    try {
      emit(state.exibirModalProcessamento());

      var infoDispositivo = await dispositivoServico.getInfoDispositivo();

      await multifatorialServico.iniciar(
        cpfCnpj: gerenciadorUsuario.usuario!.cpf + gerenciadorUsuario.usuario!.empresaSelecionada!.cnpj,
        nomeDipositivo: infoDispositivo.nome,
      );

      var identificadorMultifatorial = await multifatorialServico.cadastrarDispositivo(
        gerenciadorUsuario.obterStatusDispositivo()!,
      );

      var requisicao = AssociarDispositivoMultifatorialRequisicaoDTO(
        idMultifatorial: identificadorMultifatorial!,
        cnpj: gerenciadorUsuario.usuario!.empresaSelecionada!.cnpj,
      );

      // var associacaoResposta = await gerenciarDispositivoRepositorio.associarIdentificadorMultifatorial(
      //   codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
      //   modelo: requisicao,
      // ); // TODO reabilitar

      gerenciadorUsuario.registrarCadastroDispositivo();

      emit(state.fecharModalProcessamento());

      onIniciar(emit);
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
      gerenciadorUsuario.registrarErroMultifatorial();
      emit(state.copyWith(
        etapa: () => CadastrarDispositivoEtapa.exibirErroCadastroMultifatorial,
        mensagemErroMultifatorial: () => ex.toString(),
      ));
    }
  }

  Future<void> _onIrParaGuiaHabilitacao(Emitter<CadastrarDispositivoState> emit) async {
    emit(state.redirecionar(rotaDestino: InternetBankingRotas.guiaHabilitacaoMultifatorial));
  }

  Future<void> _onFinalizar(Emitter<CadastrarDispositivoState> emit) async {
    emit(state.redirecionar(rotaDestino: gerenciadorUsuario.definirRotaAutenticacao()));
  }
}
