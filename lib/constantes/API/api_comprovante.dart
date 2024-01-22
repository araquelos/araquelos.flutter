abstract class APIComprovante {
  static String urlListarTransacoes = "Comprovante/ListarTransacoes";
  static String urlBuscarComprovantesPaginados =
      "Comprovante/BuscarComprovantesPaginados/{codigoSessao}/{codigoTransacao}";
  static String urlBuscarXmlPorOperacao = "Comprovante/ObterHtmlPorOperacao/{codigoSessao}/{idOperacao}/{ehReemissao}";
}
