part of 'extrato_bloc.dart';

enum ExtratoEtapa {
  exibirLancamentos,
}

enum FiltroExtratoPeriodoEnum {
  ultimos15dias,
  ultimos30dias,
  ultimos60dias,
  outroPeriodo;
}

enum FiltroExtratoTipoTransacaoEnum {
  entradas,
  saidas;

  String get nome {
    switch (this) {
      case FiltroExtratoTipoTransacaoEnum.entradas:
        return "ENTRADAS";
      case FiltroExtratoTipoTransacaoEnum.saidas:
        return "SAÍDAS";
    }
  }
}

class ExtratoState extends IEstadoComEtapa<ExtratoState, ExtratoEtapa> {
  final Extrato? extrato;
  final List<MovimentoDiario> movimentos;
  final List<String> listaOperacoes;
  final List<String> listaOperacoesSelecionadas;
  final DateTime dataInicial;
  final DateTime dataFinal;
  final bool filtroTextoAtivo;
  final FiltroExtratoPeriodoEnum filtroPeriodo;
  final FiltroExtratoTipoTransacaoEnum? filtroTipoTransacao;

  bool get filtroPeriodoAtivo => filtroPeriodo == FiltroExtratoPeriodoEnum.outroPeriodo;
  bool get filtroTipoTransacaoAtivo => filtroTipoTransacao != null;

  ExtratoState({
    required super.etapa,
    required this.extrato,
    required this.movimentos,
    required this.listaOperacoes,
    required this.listaOperacoesSelecionadas,
    required this.dataInicial,
    required this.dataFinal,
    required this.filtroTextoAtivo,
    required this.filtroPeriodo,
    required this.filtroTipoTransacao,
  });

  @override
  ExtratoState copyWith({
    ExtratoEtapa? Function()? etapa,
    Extrato? Function()? extrato,
    List<MovimentoDiario> Function()? movimentos,
    List<String> Function()? listaOperacoes,
    List<String> Function()? listaOperacoesSelecionadas,
    DateTime Function()? dataInicial,
    DateTime Function()? dataFinal,
    bool Function()? filtroTextoAtivo,
    FiltroExtratoPeriodoEnum Function()? filtroPeriodo,
    FiltroExtratoTipoTransacaoEnum? Function()? filtroTipoTransacao,
  }) {
    return alterarEstado(
      novaInstancia: ExtratoState(
        etapa: etapa != null ? etapa() : this.etapa,
        dataInicial: avaliarFuncao(funcao: dataInicial, valorAtual: this.dataInicial),
        dataFinal: avaliarFuncao(funcao: dataFinal, valorAtual: this.dataFinal),
        extrato: avaliarFuncao(funcao: extrato, valorAtual: this.extrato),
        movimentos: avaliarFuncao(funcao: movimentos, valorAtual: this.movimentos),
        listaOperacoes: avaliarFuncao(funcao: listaOperacoes, valorAtual: this.listaOperacoes),
        listaOperacoesSelecionadas:
            avaliarFuncao(funcao: listaOperacoesSelecionadas, valorAtual: this.listaOperacoesSelecionadas),
        filtroTextoAtivo: avaliarFuncao(funcao: filtroTextoAtivo, valorAtual: this.filtroTextoAtivo),
        filtroPeriodo: avaliarFuncao(funcao: filtroPeriodo, valorAtual: this.filtroPeriodo),
        filtroTipoTransacao: avaliarFuncao(funcao: filtroTipoTransacao, valorAtual: this.filtroTipoTransacao),
      ),
    );
  }
}
