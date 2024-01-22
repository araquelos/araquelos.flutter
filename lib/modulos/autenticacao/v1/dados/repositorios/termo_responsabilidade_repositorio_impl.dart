import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_termo_responsabilidade.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/termo_responsabilidade_repositorio.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class TermoResponsabilidadeRepositorioImpl extends ITermoResponsabilidadeRepositorio {
  @override
  Future<void> aceitarTermoResponsabilidade(String codigoSessao) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APITermoResponsabilidade.urlAceitar)
      ..adicionarPathParam("codigoSessao", codigoSessao);

    await requisicao.executar();
  }
}
