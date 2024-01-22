import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';
import 'package:uuid/uuid.dart';

class MultifatorialServicoMock extends IMultifatorialServico {
  @override
  Future<void> iniciar({required String cpfCnpj, required String nomeDipositivo}) async {}

  @override
  Future<String?> obterDeviceID() async {
    return const Uuid().v4();
  }

  @override
  Future<String?> cadastrarDispositivo(StatusDispositivoEnum statusDispositivo) async {
    return const Uuid().v4();
  }
}
