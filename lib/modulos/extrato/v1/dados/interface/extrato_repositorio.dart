import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/extrato_tarifas_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/obter_extrato_requisicao_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/obter_extrato_resposta_dto.dart';

abstract class IExtratoRepositorio {
  Future<ObterExtratoRespostaDTO> obterExtrato(
      {required String codigoSessao, required ObterExtratoRequisicaoDTO modelo});
  Future<ExtratoTarifasDTO> obterExtratoTarifas({required String codigoSessao});
}
