part of 'reemissao_comprovante_bloc.dart';

sealed class ReemissaoComprovanteEvent extends ReplayEvent {}

class ReeemissaoComprovanteEventIniciar extends ReemissaoComprovanteEvent {}

class ReemissaoComprovanteEventAlterarFiltro extends ReemissaoComprovanteEvent {
  final String filtro;

  ReemissaoComprovanteEventAlterarFiltro({
    required this.filtro,
  });
}

class ReemissaoComprovanteEventSelecionarTransacao extends ReemissaoComprovanteEvent {
  final TransacaoDTO transacaoSelecionada;

  ReemissaoComprovanteEventSelecionarTransacao({
    required this.transacaoSelecionada,
  });
}

class ReemissaoComprovanteEventAvancarPagina extends ReemissaoComprovanteEvent {}

class ReemissaoComprovanteEventSelecionarComprovante extends ReemissaoComprovanteEvent {
  final ComprovanteMinificadoDTO comprovanteSelecionado;

  ReemissaoComprovanteEventSelecionarComprovante({required this.comprovanteSelecionado});
}

class ReemissaoComprovanteEventCompartilharComprovante extends ReemissaoComprovanteEvent {
  final GlobalKey globalKey;

  ReemissaoComprovanteEventCompartilharComprovante({required this.globalKey});
}

class ReemissaoComprovanteEventVoltar extends ReemissaoComprovanteEvent {}
