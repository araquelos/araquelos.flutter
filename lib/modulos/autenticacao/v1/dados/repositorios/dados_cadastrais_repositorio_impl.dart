import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_dados_cadastrais.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/finalizar_atualizacao_cadastral_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/iniciar_atualizacao_cadastral_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/dados_cadastrais_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_multifatorial_enum.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class DadosCadastraisRepositorioImpl extends IDadosCadastraisRepositorio {
  @override
  Future<IniciarAtualizacaoCadastralRespostaDTO> iniciarAtualizacaoCadastral({
    required String codigoSessao,
    required TipoAutenticacaoMultifatorialEnum tipoAutenticacaoMultifatorial,
    required DadosContatoDTO modelo,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIDadosCadastrais.urlIniciarAtualizacaoCadastral)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("tipoAutenticacaoMultifatorial", tipoAutenticacaoMultifatorial.name)
      ..adicionarCorpoJson(modelo.toJson());

    return IniciarAtualizacaoCadastralRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<void> finalizarAtualizacaoCadastral({
    required String codigoSessao,
    required String token,
    required FinalizarAtualizacaoCadastralRequisicaoDTO modelo,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIDadosCadastrais.urlFinalizarAtualizacaoCadastral)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("token", token)
      ..adicionarCorpoJson(modelo.toJson());

    await requisicao.executar();
  }
}
