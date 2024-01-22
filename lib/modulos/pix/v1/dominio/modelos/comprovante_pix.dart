class ComprovantePix {
  String titularOrigem;
  String agenciaOrigem;
  String contaOrigem;
  String tipoContaOrigem;
  String instituicaoDestino;
  String titularDestino;
  String cpfDestino;
  String agenciaDestino;
  String contaDestino;
  String tipoContaDestino;
  String idDestino;
  String tipoPagamentoDestino;
  String finalidadeDestino;
  String descricaoDestino;
  String autenticacaoDestino;
  double valor;

  ComprovantePix({
    required this.titularOrigem,
    required this.agenciaOrigem,
    required this.contaOrigem,
    required this.tipoContaOrigem,
    required this.instituicaoDestino,
    required this.titularDestino,
    required this.cpfDestino,
    required this.agenciaDestino,
    required this.contaDestino,
    required this.tipoContaDestino,
    required this.idDestino,
    required this.tipoPagamentoDestino,
    required this.finalidadeDestino,
    required this.descricaoDestino,
    required this.autenticacaoDestino,
    required this.valor,
  });
}
