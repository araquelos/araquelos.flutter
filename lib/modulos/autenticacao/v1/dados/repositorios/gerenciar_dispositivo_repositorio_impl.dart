import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_gerenciar_dispositivo.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/renomear_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/gerenciar_dispositivo_repositorio.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class GerenciarDispositivoRepositorioImpl extends IGerenciarDispositivoRepositorio {
  @override
  Future<void> renomear({required String codigoSessao, required RenomearRequisicaoDTO modelo}) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIGerenciarDispositivo.urlRenomear)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarCorpoJson(modelo.toJson());

    await requisicao.executar();
  }

  @override
  Future<AssociarDispositivoMultifatorialRespostaDTO> associarIdentificadorMultifatorial({
    required String codigoSessao,
    required AssociarDispositivoMultifatorialRequisicaoDTO modelo,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIGerenciarDispositivo.urlAssociarIdentificadorMultifatorial)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarCorpoJson(modelo.toJson());

    return AssociarDispositivoMultifatorialRespostaDTO.fromJson(await requisicao.executar());
  }
}
