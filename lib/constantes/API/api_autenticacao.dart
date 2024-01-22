abstract class APIAutenticacao {
  static const String urlAutenticar = "Autenticacao/Autenticar";
  static const String urlDerrubarSessao = "Autenticacao/DerrubarSessao/{token}";
  static const String urlSelecionarConta = "Autenticacao/SelecionarConta/{codigoSessao}/{ehSelecaoApp}";
  static const String urlDetalharEmpresa = "Autenticacao/DetalharEmpresa/{codigoSessao}/{cnpj}";
}
