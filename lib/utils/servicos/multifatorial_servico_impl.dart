import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';
import 'package:uuid/uuid.dart';
import 'package:voxauthflutter/voxauthflutter.dart';

class MultifatorialServicoImpl extends IMultifatorialServico {
  static final Voxauthflutter _voxAuthFlutter = Voxauthflutter();
  bool iniciado = false;

  @override
  Future iniciar({required String cpfCnpj, required String nomeDipositivo}) async {
    // await _voxAuthFlutter.SDKClient(
    //     InternetBankingConstantesMultifatorial.multifatorialUrl,
    //     InternetBankingConstantesMultifatorial.multifatorialCanalAndroid,
    //     InternetBankingConstantesMultifatorial.multifatorialSenhaAndroid,
    //     cpfCnpj,
    //     nomeDipositivo);

    // if (iniciado) return;

    // TODO SyncDate();

    //iniciado = true;
  }

  @override
  Future<String?> obterDeviceID() async {
    return await _voxAuthFlutter.getDeviceID();
  }

  @override
  Future<String?> cadastrarDispositivo(StatusDispositivoEnum statusDispositivo) async {
    return const Uuid().v4();
    //throw UnimplementedError();
  }
}
