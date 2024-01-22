import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/assinar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/buscar_quantidade_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/cancelar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_paginadas_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_requisicao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_detalhada_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';

abstract class IAssinaturaRepositorio {
  Future<AssinarResponseDTO> assinar({
    required int idOperacao,
    required String codigoSessao,
  });

  Future<BuscarQuantidadeResponseDTO> buscarQuantidade({
    required FiltroAssinaturaTipoTransacaoEnum filtro,
    required String codigoSessao,
  });

  Future<CancelarResponseDTO> cancelar({
    required int idOperacao,
    required String codigoSessao,
  });

  Future<OperacaoDetalhadaRespostaDTO> consultarOperacao({
    required int idOperacao,
    required String codigoSessao,
  });

  Future<ListarOperacoesPaginadasRespostaDTO> listarOperacoesPaginadas({
    required String codigoSessao,
    required ListarOperacoesRequisicaoDTO corpoRequisicao,
  });

  Future permiteAssinar({
    required int idOperacao,
    required String codigoSessao,
  });

  Future permiteCancelar({
    required int idOperacao,
    required String codigoSessao,
  });
}
