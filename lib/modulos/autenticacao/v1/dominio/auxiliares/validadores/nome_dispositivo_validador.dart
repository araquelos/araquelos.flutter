String? nomeDispositivoValidador(String? nomeDispositivo) {
  if (nomeDispositivo == null || nomeDispositivo.isEmpty) {
    return 'Digite o nome do dispositivo';
  } else {
    return null;
  }
}
