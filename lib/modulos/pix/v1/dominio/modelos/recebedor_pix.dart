class RecebedorPix {
  String nome;
  String cpf;
  String chavePix;
  String tipoChavePix;
  String descricaoTpTransacao;
  String instituicao;
  double valor;
  String dataVencimento;
  String dataExpiracao;

  RecebedorPix({
    required this.nome,
    required this.cpf,
    required this.chavePix,
    required this.tipoChavePix,
    required this.instituicao,
    this.valor = 0,
    this.dataVencimento = '',
    this.dataExpiracao = '',
    this.descricaoTpTransacao = '',
  });
}
