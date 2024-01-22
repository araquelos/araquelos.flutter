import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_comprovante.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_comprovantes_paginados_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_xml_por_operacao_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class ComprovanteRepositorioImpl implements IComprovanteRepositorio {
  @override
  Future<List<TransacaoDTO>> listarTransacoes() async {
    var requisicao = fabrica<ExecutorHttp>()..comoPost(APIComprovante.urlListarTransacoes);
    var resultado = await requisicao.executar() as List;
    return resultado.map((json) => TransacaoDTO.fromJson(json)).toList();
  }

  @override
  Future<ObterComprovantesPaginadosRespostaDTO> obterComprovantesPaginados({
    required String codigoSessao,
    required String codigoTransacao,
    required PaginadorDTO paginador,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIComprovante.urlBuscarComprovantesPaginados)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("codigoTransacao", codigoTransacao)
      ..adicionarCorpoJson(paginador.toJson());

    return ObterComprovantesPaginadosRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<ObterXmlPorOperacaoRespostaDTO> obterXmlPorOperacao({
    required String codigoSessao,
    required int idOperacao,
    required bool ehReemissao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIComprovante.urlBuscarXmlPorOperacao)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("ehReemissao", ehReemissao.toString());

    return ObterXmlPorOperacaoRespostaDTO.fromJson(await requisicao.executar());
  }
}
