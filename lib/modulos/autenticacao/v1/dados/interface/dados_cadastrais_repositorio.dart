import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/finalizar_atualizacao_cadastral_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/iniciar_atualizacao_cadastral_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_multifatorial_enum.dart';

abstract class IDadosCadastraisRepositorio {
  Future<IniciarAtualizacaoCadastralRespostaDTO> iniciarAtualizacaoCadastral({
    required String codigoSessao,
    required TipoAutenticacaoMultifatorialEnum tipoAutenticacaoMultifatorial,
    required DadosContatoDTO modelo,
  });

  Future<void> finalizarAtualizacaoCadastral({
    required String codigoSessao,
    required String token,
    required FinalizarAtualizacaoCadastralRequisicaoDTO modelo,
  });
}
