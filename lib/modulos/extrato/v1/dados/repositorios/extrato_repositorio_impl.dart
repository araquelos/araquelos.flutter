import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_extrato.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/obter_extrato_requisicao_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/obter_extrato_resposta_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/extrato_tarifas_dto.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/interface/extrato_repositorio.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class ExtratoRepositorioImpl extends IExtratoRepositorio {
  @override
  Future<ObterExtratoRespostaDTO> obterExtrato({
    required String codigoSessao,
    required ObterExtratoRequisicaoDTO modelo,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIExtrato.urlObterExtrato)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarCorpoJson(modelo.toJson());

    return ObterExtratoRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<ExtratoTarifasDTO> obterExtratoTarifas({
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIExtrato.urlObterExtratoTarifas)
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return ExtratoTarifasDTO.fromJson(await requisicao.executar());
  }
}
