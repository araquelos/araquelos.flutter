class APIAssinatura {
  static const String urlAssinar = "Assinatura/Assinar/{codigoSessao}/{idOperacao}";
  static const String urlBuscarQuantidade = "Assinatura/BuscarQuantidade/{codigoSessao}/{filtro}";
  static const String urlCancelar = "Assinatura/Cancelar/{codigoSessao}/{idOperacao}";
  static const String urlConsultarOperacao = "Assinatura/ConsultarOperacao/{codigoSessao}/{idOperacao}";
  static const String urlListarOperacoesPaginadas = "Assinatura/ListarOperacoesPaginadas/{codigoSessao}";
  static const String urlPermiteAssinar = "Assinatura/PermiteAssinar/{codigoSessao}/{idOperacao}";
  static const String urlPermiteCancelar = "Assinatura/PermiteCancelar/{codigoSessao}/{idOperacao}";
}
