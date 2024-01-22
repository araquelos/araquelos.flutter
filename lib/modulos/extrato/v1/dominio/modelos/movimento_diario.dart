import 'package:mobile_pj/modulos/extrato/v1/dominio/modelos/movimento.dart';

class MovimentoDiario {
  final String data;
  final String saldo;
  final List<Movimento> movimentos;

  MovimentoDiario({
    required this.data,
    required this.saldo,
    required this.movimentos,
  });
}
