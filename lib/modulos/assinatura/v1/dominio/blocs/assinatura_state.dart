part of 'assinatura_bloc.dart';

enum AssinaturaEtapa {
  exibirListaOperacoes,
  exibirDetalheOperacao,
}

class AssinaturaState extends IEstadoComEtapa<AssinaturaState, AssinaturaEtapa> {
  final FiltroAssinaturaTipoTransacaoEnum? filtro;
  final List<OperacaoMinificadaDTO> listaOperacoes;
  final PaginadorDTO paginador;
  final OperacaoDetalhadaRespostaDTO? operacaoSelecionada;
  final OperacaoRevisao? operacaoRevisao;

  AssinaturaState({
    required super.etapa,
    required this.filtro,
    required this.paginador,
    required this.listaOperacoes,
    required this.operacaoSelecionada,
    required this.operacaoRevisao,
  });

  @override
  copyWith({
    AssinaturaEtapa Function()? etapa,
    FiltroAssinaturaTipoTransacaoEnum? Function()? filtro,
    PaginadorDTO Function()? paginador,
    List<OperacaoMinificadaDTO> Function()? listaOperacoes,
    OperacaoDetalhadaRespostaDTO? Function()? operacaoSelecionada,
    OperacaoRevisao? Function()? operacaoRevisao,
  }) {
    return alterarEstado(
      novaInstancia: AssinaturaState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        filtro: avaliarFuncao(funcao: filtro, valorAtual: this.filtro),
        paginador: avaliarFuncao(funcao: paginador, valorAtual: this.paginador),
        listaOperacoes: avaliarFuncao(funcao: listaOperacoes, valorAtual: this.listaOperacoes),
        operacaoSelecionada: avaliarFuncao(funcao: operacaoSelecionada, valorAtual: this.operacaoSelecionada),
        operacaoRevisao: avaliarFuncao(funcao: operacaoRevisao, valorAtual: this.operacaoRevisao),
      ),
    );
  }
}
