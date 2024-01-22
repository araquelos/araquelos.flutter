import "dart:developer";

import "package:dio/dio.dart";
import 'package:mobile_pj/constantes/internet_banking_http.dart';
import "package:mobile_pj/utils/http/excecoes/erro_infraestrutura_excecao.dart";
import "package:mobile_pj/utils/http/excecoes/erro_negocio_excecao.dart";

class ExecutorHttp {
  static const String get = "GET";
  static const String post = "POST";

  final String _urlBase = InternetBankingHttp.hostBase;
  final int _porta = InternetBankingHttp.porta;
  String? _metodo;
  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'accept': 'application/json'
  };
  Map<String, dynamic>? _queryParams;
  final List<String> _pathParams = List<String>.from(InternetBankingHttp.contextoCentralizador);
  Map<String, dynamic>? _corpo;

  comoGet(String endpoint) {
    _pathParams.addAll(endpoint.split('/'));
    _metodo = get;
  }

  comoPost(String endpoint) {
    _pathParams.addAll(endpoint.split('/'));
    _metodo = post;
  }

  adicionarCabecalhos(String chave, dynamic valor) {
    _headers.addAll({chave: valor.toString()});
  }

  adicionarQueryParam(String chave, dynamic valor) {
    _queryParams ??= {};
    _queryParams!.addAll({chave: valor});
  }

  adicionarPathParam(String parametro, String valor) {
    try {
      _pathParams[_pathParams.indexOf("{$parametro}")] = valor;
    } on Exception {
      throw Exception("URL não possui parâmetro solicitado.");
    }
  }

  adicionarCorpoJson(Map<String, dynamic> corpo) {
    _corpo = corpo;
  }

  Future<dynamic> executar() async {
    log("====================INICIANDO REQUISIÇÃO====================");
    try {
      Uri uri = Uri(
        scheme: "http",
        port: _porta,
        host: _urlBase,
        pathSegments: _pathParams,
        queryParameters: _queryParams,
      );

      log("Requisição: \nHost: $_urlBase:$_porta\nPath: ${_pathParams.toString()}\nBody: $_corpo\nHeaders: ${_headers.toString()}");

      Response response = await Dio().requestUri(
        uri,
        options: Options(headers: _headers, method: _metodo!),
        data: _corpo,
      );

      log("Resposta: ${response.data}");

      if (response.data == "") return null;

      if (response.data is List) {
        log("====================FINALIZANDO REQUISIÇÃO====================");
        return response.data.map((json) => json as Map<String, dynamic>).toList();
      } else {
        log("====================FINALIZANDO REQUISIÇÃO====================");
        return response.data;
      }
    } on DioException catch (ex) {
      if (ex.response!.statusCode! == 400 || ex.response!.statusCode! == 555) {
        log("Erro de negócio: ${ex.response!.statusCode!} | ${ex.response!.data.toString()}");
        throw ErroNegocioExcecao(codigoRetorno: ex.response!.statusCode!, mensagem: ex.response!.data.toString());
      } else {
        log("Erro de infraestrutura: ${ex.response!.statusCode!} | ${ex.response!.data.toString()}");
        throw ErroInfraestruturaExcecao(codigoErro: ex.response!.statusCode!, mensagem: ex.response!.data.toString());
      }
    }
  }
}
