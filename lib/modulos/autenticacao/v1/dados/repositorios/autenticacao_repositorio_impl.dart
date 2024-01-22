import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_autenticacao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/detalhar_empresa_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/selecionar_conta_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class AutenticacaoRepositorioImpl implements IAutenticacaoRepositorio {
  @override
  Future<AutenticarRespostaDTO> autenticar(AutenticarRequisicaoDTO modelo) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAutenticacao.urlAutenticar)
      ..adicionarCorpoJson(modelo.toJson());

    return AutenticarRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<AutenticarRespostaDTO> derrubarSessao(String token) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAutenticacao.urlDerrubarSessao)
      ..adicionarQueryParam("token", token);

    return AutenticarRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<DetalharEmpresaRespostaDTO> detalharEmpresa(String codigoSessao, String cnpj) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAutenticacao.urlDetalharEmpresa)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("cnpj", cnpj);

    return DetalharEmpresaRespostaDTO.fromJson(await requisicao.executar());
  }

  @override
  Future selecionarConta(SelecionarContaRequisicaoDTO conta, String codigoSessao, bool ehSelecaoApp) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APIAutenticacao.urlSelecionarConta)
      ..adicionarPathParam("ehSelecaoApp", ehSelecaoApp.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarCorpoJson(conta.toJson());

    await requisicao.executar();
  }
}
