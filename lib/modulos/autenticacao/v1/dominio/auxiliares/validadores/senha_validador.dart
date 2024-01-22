String? senhaValidador(String? senha) {
  if (senha == null || senha.isEmpty) {
    return 'Campo obrigatório';
  }

  if (senha.length >= 9) {
    return 'Sua senha deve possuir até 8 dígitos';
  }

  return null;
}
