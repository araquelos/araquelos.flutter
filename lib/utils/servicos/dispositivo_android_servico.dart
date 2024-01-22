import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_autenticacao_dto.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_servico.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';

class DispositivoAndroidServico extends DispositivoServico {
  DispositivoAndroidServico({required IMultifatorialServico multifatorialServico})
      : super(multifatorialServico: multifatorialServico);

  @override
  Future<DispositivoAutenticacaoDTO> getInfoDispositivo() async {
    AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    DispositivoAutenticacaoDTO dispositivoAutenticacao = DispositivoAutenticacaoDTO(
        id: await multifatorialServico.obterDeviceID() ?? "",
        nome: await getDeviceName(),
        marca: androidInfo.manufacturer,
        sistemaOperacional: SistemaOperacionalEnum.android.toString(),
        modelo: androidInfo.model);
    return dispositivoAutenticacao;
  }

  Future<String> getDeviceName() async {
    const platform = MethodChannel('com.example.device_name');
    return await platform.invokeMethod('getDeviceName');
  }
}
