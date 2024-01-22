abstract class APICaixaPostal {
  static const String urlObterQuantidadeMensagensNaoLidas =
      "CaixaPostal/ObterQuantidadeMensagensNaoLidas/{codigoSessao}";
  static const String urlExcluirMensagens = "CaixaPostal/ExcluirMensagens/{codigoSessao}";
  static const String urlMarcarMensagemComoLida = "CaixaPostal/MarcarMensagemComoLida/{codigoSessao}/{idMensagem}";
  static const String urlObterMensagens = "CaixaPostal/ObterMensagens/{codigoSessao}";
}
