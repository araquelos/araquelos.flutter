String? validarTelefone(String? telefone) {
  if (telefone == null || telefone.isEmpty) {
    return 'Campo obrigatório';
  }

  if (telefone.length != 15) {
    return 'O telefone deve possuir 11 dígitos';
  }

  return null;
}
