import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/obter_extrato_requisicao_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/interface/extrato_repositorio.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/extrato.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento_diario.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/enum/tipo_conta_poupanca_enum.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'extrato_state.dart';
part 'extrato_event.dart';

class ExtratoBloc extends InternetBankingBlocBase<ExtratoEvent, ExtratoState> {
  IExtratoRepositorio extratoRepositorio;
  GerenciadorUsuario gerenciadorUsuario;
  ISaldoRepositorio saldoRepositorio;

  ExtratoBloc({
    required this.extratoRepositorio,
    required this.gerenciadorUsuario,
    required this.saldoRepositorio,
  }) : super(ExtratoState(
          etapa: null,
          extrato: null,
          movimentos: [],
          listaOperacoes: [],
          listaOperacoesSelecionadas: [],
          dataInicial: DateTime.now().add(const Duration(days: -15)),
          dataFinal: DateTime.now(),
          filtroTextoAtivo: false,
          filtroPeriodo: FiltroExtratoPeriodoEnum.ultimos15dias,
          filtroTipoTransacao: null,
        )) {
    on<ExtratoEvent>((evento, emit) async {
      switch (evento) {
        case ExtratoEventIniciar():
          await onIniciar(emit);
        case ExtratoEventFiltrarPeriodo():
          await _onFiltrarPeriodo(evento, emit);
        case ExtratoEventFiltrar():
          await _onFiltrar(evento, emit);
        case ExtratoEventLimparFiltros():
          await _onLimparFiltros(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<ExtratoState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      Extrato extrato = await _consultarExtrato(state.dataInicial, state.dataFinal);

      emit(state.copyWith(
        etapa: () => ExtratoEtapa.exibirLancamentos,
        extrato: () => extrato,
        movimentos: () => extrato.movimentosDiarios,
        listaOperacoes: () => extrato.gerarListaOperacoes(),
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onFiltrarPeriodo(ExtratoEventFiltrarPeriodo evento, Emitter<ExtratoState> emit) async {
    try {
      if (evento.dataFinal.difference(evento.dataInicial).inDays > 60) {
        emit(
          state.exibirModalErro(
            tituloMensagem: "Período de consulta inválido",
            mensagem: "Diferença entre data inicial e data final da consulta não pode ser superior a 60 dias.",
          ),
        );
        return;
      }

      emit(state.exibirModalProcessamento());

      Extrato extrato = await _consultarExtrato(evento.dataInicial, evento.dataFinal);

      emit(state.fecharModalProcessamento());
      emit(state.fecharModalProcessamento());

      emit(state.copyWith(
        extrato: () => extrato,
        movimentos: () => extrato.movimentosDiarios,
        listaOperacoes: () => extrato.gerarListaOperacoes(),
        listaOperacoesSelecionadas: () => [],
        dataInicial: () => evento.dataInicial,
        dataFinal: () => evento.dataFinal,
        filtroPeriodo: () => evento.filtroPeriodo,
        filtroTipoTransacao: () => null,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onFiltrar(
    ExtratoEventFiltrar evento,
    Emitter<ExtratoState> emit,
  ) async {
    List<MovimentoDiario> movimentos = state.extrato!.movimentosDiarios
        .where((movimentoDiario) => movimentoDiario.movimentos.any(
              (movimento) => movimento.filtrar(
                filtroTexto: evento.textoFiltro,
                filtroTipoTransacao: evento.filtroTipoTransacao,
                filtroOperacoes: evento.operacoesSelecionadas,
              ),
            ))
        .toList();

    movimentos = movimentos.map((movimentoDiario) {
      return MovimentoDiario(
        data: movimentoDiario.data,
        saldo: movimentoDiario.saldo,
        movimentos: movimentoDiario.movimentos
            .where((movimento) => movimento.filtrar(
                  filtroTexto: evento.textoFiltro,
                  filtroTipoTransacao: evento.filtroTipoTransacao,
                  filtroOperacoes: evento.operacoesSelecionadas,
                ))
            .toList(),
      );
    }).toList();

    emit(state.copyWith(
      filtroTextoAtivo: () => evento.textoFiltro != null && evento.textoFiltro != "",
      filtroTipoTransacao: () => evento.filtroTipoTransacao,
      listaOperacoesSelecionadas: () => evento.operacoesSelecionadas,
      movimentos: () => movimentos,
    ));
  }

  Future<Extrato> _consultarExtrato(DateTime dataInicial, DateTime dataFinal) async {
    ObterExtratoRequisicaoDTO modelo = ObterExtratoRequisicaoDTO(
      dataInicial: dataInicial,
      dataFinal: dataFinal,
      tipoContaPoupanca:
          gerenciadorUsuario.usuario!.empresaSelecionada!.contaSelecionada!.tipoConta == TipoContaEnum.contaCorrente
              ? null
              : TipoContaPoupanca.nova,
    );

    var resultado = await extratoRepositorio.obterExtrato(
      codigoSessao: gerenciadorUsuario.usuario!.codigoSessao,
      modelo: modelo,
    );

    return Extrato.montarExtrato(resultado.valor);
  }

  Future<void> _onLimparFiltros(Emitter<ExtratoState> emit) async {
    emit(state.copyWith(
      etapa: () => null,
      extrato: () => null,
      movimentos: () => [],
      listaOperacoes: () => [],
      listaOperacoesSelecionadas: () => [],
      dataInicial: () => DateTime.now().add(const Duration(days: -15)),
      dataFinal: () => DateTime.now(),
      filtroTextoAtivo: () => false,
      filtroPeriodo: () => FiltroExtratoPeriodoEnum.ultimos15dias,
      filtroTipoTransacao: () => null,
    ));

    await onIniciar(emit);
  }
}
