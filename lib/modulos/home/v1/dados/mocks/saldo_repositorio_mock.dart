import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_corrente_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_request_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/DTO/saldo_conta_poupanca_response_dto.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';

class SaldoRepositorioMock extends ISaldoRepositorio {
  @override
  Future<SaldoContaCorrenteResponseDTO> buscarSaldoContaCorrente({
    required String codigoSessao,
    required bool auditar,
  }) async {
    return const SaldoContaCorrenteResponseDTO(
      saldo: 10000,
      saldoDisponivelSaque: 10000,
      limiteUtilizado: 10000,
      tarifaPendenteCobranca: 10000,
      bloqueioParcelaCreditoAtraso: 10000,
      saldoBloqueado: 10000,
      saldoDisponivelContaInvestimento: 10000,
      saldoTotal: 10000,
      descricaoLimite: "Saldo mock",
      limite: 10000,
      taxaJuros: 10000,
      juros: 10000,
      iof: 10000,
    );
  }

  @override
  Future<SaldoContaPoupancaResponseDTO> buscarSaldoContaPoupanca({
    required String codigoSessao,
    required bool auditar,
    required SaldoContaPoupancaRequestDTO corpo,
  }) async {
    return const SaldoContaPoupancaResponseDTO(
      saldo: 10000,
      saldoDisponivelSaque: 10000,
      saldoBloqueado: 10000,
      saldoTotal: 10000,
      saldoProvisaoCpmf: 10000,
      saldoBloqueado24HAntesLancamento: 10000,
      saldoBloqueadoIndeterminadoAntesLancamento: 10000,
    );
  }
}
