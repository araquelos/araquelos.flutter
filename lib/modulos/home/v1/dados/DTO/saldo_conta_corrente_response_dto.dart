import 'package:freezed_annotation/freezed_annotation.dart';

part 'saldo_conta_corrente_response_dto.freezed.dart';
part 'saldo_conta_corrente_response_dto.g.dart';

@freezed
class SaldoContaCorrenteResponseDTO with _$SaldoContaCorrenteResponseDTO {
  const factory SaldoContaCorrenteResponseDTO({
    required double saldo,
    required double saldoDisponivelSaque,
    required double limiteUtilizado,
    required double tarifaPendenteCobranca,
    required double bloqueioParcelaCreditoAtraso,
    required double saldoBloqueado,
    required double saldoDisponivelContaInvestimento,
    required double saldoTotal,
    required String descricaoLimite,
    required double limite,
    required double taxaJuros,
    required double juros,
    required double iof,
  }) = _SaldoContaCorrenteResponseDTO;

  factory SaldoContaCorrenteResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SaldoContaCorrenteResponseDTOFromJson(json);
}
