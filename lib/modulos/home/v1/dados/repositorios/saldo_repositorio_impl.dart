import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/API/api_saldo.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_corrente_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_request_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';

class SaldoRepositorioImpl implements ISaldoRepositorio {
  @override
  Future<SaldoContaCorrenteResponseDTO> buscarSaldoContaCorrente({
    required String codigoSessao,
    required bool auditar,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APISaldo.urlConsultarSaldoContaCorrente)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("auditar", auditar.toString());

    return SaldoContaCorrenteResponseDTO.fromJson(await requisicao.executar());
  }

  @override
  Future<SaldoContaPoupancaResponseDTO> buscarSaldoContaPoupanca({
    required String codigoSessao,
    required SaldoContaPoupancaRequestDTO corpo,
    required bool auditar,
  }) async {
    var requisicao = fabrica<ExecutorHttp>()
      ..comoPost(APISaldo.urlConsultarSaldoContaPoupanca)
      ..adicionarPathParam("codigoSessao", codigoSessao)
      ..adicionarPathParam("auditar", auditar.toString())
      ..adicionarCorpoJson(corpo.toJson());

    return SaldoContaPoupancaResponseDTO.fromJson(await requisicao.executar());
  }
}
