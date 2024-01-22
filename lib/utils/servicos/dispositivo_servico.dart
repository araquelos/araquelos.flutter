import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_autenticacao_dto.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';

enum SistemaOperacionalEnum { android, ios }

abstract class DispositivoServico {
  IMultifatorialServico multifatorialServico;

  DispositivoServico({required this.multifatorialServico});

  Future<DispositivoAutenticacaoDTO> getInfoDispositivo();
}
