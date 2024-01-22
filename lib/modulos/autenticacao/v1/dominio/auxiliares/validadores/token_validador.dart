String? validarToken(String? valor) {
  if (valor == null) {
    return "Campo obrigatório";
  }

  if (valor.length < 6) {
    return "Token deve possuir 6 caracteres";
  }

  return null;
}
