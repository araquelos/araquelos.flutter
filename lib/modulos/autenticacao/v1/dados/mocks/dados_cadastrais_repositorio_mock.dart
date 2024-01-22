import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/finalizar_atualizacao_cadastral_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/iniciar_atualizacao_cadastral_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/dados_cadastrais_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_multifatorial_enum.dart';
import 'package:uuid/uuid.dart';

class DadosCadastraisRepositorioMock extends IDadosCadastraisRepositorio {
  @override
  Future<void> finalizarAtualizacaoCadastral({
    required String codigoSessao,
    required String token,
    required FinalizarAtualizacaoCadastralRequisicaoDTO modelo,
  }) async {}

  @override
  Future<IniciarAtualizacaoCadastralRespostaDTO> iniciarAtualizacaoCadastral({
    required String codigoSessao,
    required TipoAutenticacaoMultifatorialEnum tipoAutenticacaoMultifatorial,
    required DadosContatoDTO modelo,
  }) async {
    return IniciarAtualizacaoCadastralRespostaDTO(
      assinatura: const Uuid().v4(),
      tempoValidade: 30,
    );
  }
}
