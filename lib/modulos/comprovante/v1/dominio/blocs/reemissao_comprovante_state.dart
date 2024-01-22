part of 'reemissao_comprovante_bloc.dart';

enum EtapaReemissaoComprovante {
  exibirListaTransacoes,
  exibirListaComprovantes,
  exibirComprovante,
}

class ReemissaoComprovanteState extends IEstadoComEtapa<ReemissaoComprovanteState, EtapaReemissaoComprovante> {
  final List<TransacaoDTO>? listaTransacoes;
  final List<TransacaoDTO>? listaTransacoesFiltrada;
  final TransacaoDTO? transacaoSelecionada;
  final List<ComprovanteMinificadoDTO>? listaComprovantes;
  final List<ComprovanteMinificadoDTO>? listaComprovantesFiltrada;
  final Comprovante? comprovanteSelecionado;
  final PaginadorDTO paginador;

  get filtroTransacaoAtivo => !listEquals(listaTransacoes, listaTransacoesFiltrada);
  get filtroComprovanteAtivo => !listEquals(listaComprovantes, listaComprovantesFiltrada);

  ReemissaoComprovanteState({
    required super.etapa,
    required this.listaTransacoes,
    required this.listaTransacoesFiltrada,
    required this.transacaoSelecionada,
    required this.listaComprovantes,
    required this.listaComprovantesFiltrada,
    required this.comprovanteSelecionado,
    required this.paginador,
  });

  @override
  ReemissaoComprovanteState copyWith({
    EtapaReemissaoComprovante? Function()? etapa,
    List<TransacaoDTO>? Function()? listaTransacoes,
    List<TransacaoDTO>? Function()? listaTransacoesFiltrada,
    TransacaoDTO? Function()? transacaoSelecionada,
    List<ComprovanteMinificadoDTO>? Function()? listaComprovantes,
    List<ComprovanteMinificadoDTO>? Function()? listaComprovantesFiltrada,
    Comprovante? Function()? comprovanteSelecionado,
    PaginadorDTO Function()? paginador,
  }) {
    return alterarEstado(
      novaInstancia: ReemissaoComprovanteState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        listaTransacoes: avaliarFuncao(funcao: listaTransacoes, valorAtual: this.listaTransacoes),
        listaTransacoesFiltrada:
            avaliarFuncao(funcao: listaTransacoesFiltrada, valorAtual: this.listaTransacoesFiltrada),
        transacaoSelecionada: avaliarFuncao(funcao: transacaoSelecionada, valorAtual: this.transacaoSelecionada),
        listaComprovantes: avaliarFuncao(funcao: listaComprovantes, valorAtual: this.listaComprovantes),
        listaComprovantesFiltrada:
            avaliarFuncao(funcao: listaComprovantesFiltrada, valorAtual: this.listaComprovantesFiltrada),
        comprovanteSelecionado: avaliarFuncao(funcao: comprovanteSelecionado, valorAtual: this.comprovanteSelecionado),
        paginador: avaliarFuncao(funcao: paginador, valorAtual: this.paginador),
      ),
    );
  }
}
