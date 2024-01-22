import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_corrente_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_request_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_response_dto.dart';

abstract class ISaldoRepositorio {
  Future<SaldoContaCorrenteResponseDTO> buscarSaldoContaCorrente({
    required String codigoSessao,
    required bool auditar,
  });

  Future<SaldoContaPoupancaResponseDTO> buscarSaldoContaPoupanca({
    required String codigoSessao,
    required bool auditar,
    required SaldoContaPoupancaRequestDTO corpo,
  });
}
