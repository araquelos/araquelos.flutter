import 'package:freezed_annotation/freezed_annotation.dart';

part 'saldo_conta_poupanca_response_dto.freezed.dart';
part 'saldo_conta_poupanca_response_dto.g.dart';

@freezed
class SaldoContaPoupancaResponseDTO with _$SaldoContaPoupancaResponseDTO {
  const factory SaldoContaPoupancaResponseDTO({
    required double saldo,
    required double saldoDisponivelSaque,
    required double saldoBloqueado,
    required double saldoTotal,
    required double saldoProvisaoCpmf,
    required double saldoBloqueado24HAntesLancamento,
    required double saldoBloqueadoIndeterminadoAntesLancamento,
  }) = _SaldoContaPoupancaResponseDTO;

  factory SaldoContaPoupancaResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SaldoContaPoupancaResponseDTOFromJson(json);
}
