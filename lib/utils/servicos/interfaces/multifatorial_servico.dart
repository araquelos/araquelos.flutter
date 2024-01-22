import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';

abstract class IMultifatorialServico {
  Future iniciar({required String cpfCnpj, required String nomeDipositivo});
  Future<String?> obterDeviceID();
  Future<String?> cadastrarDispositivo(StatusDispositivoEnum statusDispositivo);
}
