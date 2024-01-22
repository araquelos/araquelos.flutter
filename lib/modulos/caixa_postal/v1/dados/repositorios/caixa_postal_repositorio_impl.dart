// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_caixa_postal.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_requisicao_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/mensagem_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/obter_quantidade_mensagens_nao_lidas_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class CaixaPostalRepositorioImpl implements ICaixaPostalRepositorio {
  @override
  Future<ObterQuantidadeMensagensNaoLidasDTO> obterQuantidadeMensagensNaoLidas({
    required String codigoSessao,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APICaixaPostal.urlObterQuantidadeMensagensNaoLidas)
      ..adicionarPathParam("codigoSessao", codigoSessao);

    return ObterQuantidadeMensagensNaoLidasDTO.fromJson(await requisicao.executar());
  }

  @override
  Future excluirMensagens({required String codigoSessao, required ExcluirMensagensRequisicaoDTO modelo}) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APICaixaPostal.urlExcluirMensagens)
      ..adicionarCorpoJson(modelo.toJson())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    await requisicao.executar();
  }

  @override
  Future marcarMensagemComoLida({required String codigoSessao, int? idMensagem}) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APICaixaPostal.urlMarcarMensagemComoLida)
      ..adicionarPathParam("idMensagem", idMensagem.toString())
      ..adicionarPathParam("codigoSessao", codigoSessao);

    await requisicao.executar();
  }

  @override
  Future<List<MensagemDTO>> obterMensagens({required String codigoSessao}) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APICaixaPostal.urlObterMensagens)
      ..adicionarPathParam("codigoSessao", codigoSessao);
    var resultado = await requisicao.executar() as List;
    return resultado.map((json) => MensagemDTO.fromJson(json)).toList();
  }
}
