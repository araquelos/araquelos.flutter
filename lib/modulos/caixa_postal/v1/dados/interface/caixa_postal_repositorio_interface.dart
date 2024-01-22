import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_requisicao_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/mensagem_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/obter_quantidade_mensagens_nao_lidas_dto.dart';

abstract class ICaixaPostalRepositorio {
  Future<ObterQuantidadeMensagensNaoLidasDTO> obterQuantidadeMensagensNaoLidas({required String codigoSessao});
  Future excluirMensagens({required String codigoSessao, required ExcluirMensagensRequisicaoDTO modelo});
  Future marcarMensagemComoLida({required String codigoSessao, int idMensagem});
  Future<List<MensagemDTO>> obterMensagens({required String codigoSessao});
}
