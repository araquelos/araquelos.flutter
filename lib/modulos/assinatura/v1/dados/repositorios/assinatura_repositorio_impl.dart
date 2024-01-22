import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_assinatura.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/assinar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/buscar_quantidade_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/cancelar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_paginadas_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_requisicao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_detalhada_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/interface/assinatura_repositorio.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class AssinaturaRepositorioImpl implements IAssinaturaRepositorio {
  @override
  Future<AssinarResponseDTO> assinar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlAssinar)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);
    return AssinarResponseDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<BuscarQuantidadeResponseDTO> buscarQuantidade({
    required FiltroAssinaturaTipoTransacaoEnum filtro,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlBuscarQuantidade)
      ..adicionarPathParam("idOperacao", filtro.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return BuscarQuantidadeResponseDTO.fromJson(await requisicao.executar()); //CORRIGIR
  }

  @override
  Future<CancelarResponseDTO> cancelar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlCancelar)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return CancelarResponseDTO.fromJson(await requisicao.executar()); //CORRIGIR
  }

  @override
  Future<OperacaoDetalhadaRespostaDTO> consultarOperacao({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlConsultarOperacao)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return OperacaoDetalhadaRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<ListarOperacoesPaginadasRespostaDTO> listarOperacoesPaginadas({
    required String codigoSessao,
    required ListarOperacoesRequisicaoDTO corpoRequisicao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlListarOperacoesPaginadas)
      ..adicionarCorpoJson(corpoRequisicao.toJson())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return ListarOperacoesPaginadasRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future permiteAssinar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlPermiteAssinar)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);
    await requisicao.executar();
  }

  @override
  Future permiteCancelar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAssinatura.urlPermiteCancelar)
      ..adicionarPathParam("idOperacao", idOperacao.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);
    await requisicao.executar();
  }
}
