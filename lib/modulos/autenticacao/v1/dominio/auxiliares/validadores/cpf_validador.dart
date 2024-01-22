String? cpfValidador(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Campo obrigatório';
  }

  if (cpf.length != 14) {
    return 'O CPF deve possuir 11 dígitos';
  }

  return null;
}
