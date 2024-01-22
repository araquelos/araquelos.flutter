import 'package:device_info_plus/device_info_plus.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_autenticacao_dto.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_servico.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';

class DispositivoIosServico extends DispositivoServico {
  DispositivoIosServico({required IMultifatorialServico multifatorialServico})
      : super(multifatorialServico: multifatorialServico);

  @override
  Future<DispositivoAutenticacaoDTO> getInfoDispositivo() async {
    IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
    DispositivoAutenticacaoDTO dispositivoAutenticacao = DispositivoAutenticacaoDTO(
        id: await multifatorialServico.obterDeviceID() ?? "",
        nome: iosInfo.name,
        marca: iosInfo.identifierForVendor ?? "",
        sistemaOperacional: SistemaOperacionalEnum.ios.toString(),
        modelo: iosInfo.model);
    return dispositivoAutenticacao;
  }
}
