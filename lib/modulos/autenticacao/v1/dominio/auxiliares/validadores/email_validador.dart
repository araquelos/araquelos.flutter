String? validarEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Campo obrigatório';
  }

  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
    return "E-mail inválido";
  }

  return null;
}
