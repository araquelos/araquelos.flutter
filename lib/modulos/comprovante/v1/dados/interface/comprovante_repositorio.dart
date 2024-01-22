import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_xml_por_operacao_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_comprovantes_paginados_resposta_dto.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

abstract class IComprovanteRepositorio {
  Future<List<TransacaoDTO>> listarTransacoes();

  Future<ObterComprovantesPaginadosRespostaDTO> obterComprovantesPaginados({
    required String codigoSessao,
    required String codigoTransacao,
    required PaginadorDTO paginador,
  });

  Future<ObterXmlPorOperacaoRespostaDTO> obterXmlPorOperacao({
    required String codigoSessao,
    required int idOperacao,
    required bool ehReemissao,
  });
}
