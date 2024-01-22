class ErroInfraestruturaExcecao implements Exception {
  int codigoErro;
  String? mensagem;

  ErroInfraestruturaExcecao({required this.codigoErro, required this.mensagem});
}
