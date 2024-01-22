class OperacaoRevisao {
  List<OperacaoGrupo> lista = [];
  bool pendenteAssinaturaUsuarioLogado;

  OperacaoRevisao({
    required this.pendenteAssinaturaUsuarioLogado,
  });
}

class OperacaoGrupo {
  final String titulo;
  List<Map<String, String>> lista = [];

  OperacaoGrupo({required this.titulo});
}
