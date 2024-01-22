import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/enum/tipo_conta_poupanca_enum.dart';

part 'saldo_conta_poupanca_request_dto.freezed.dart';
part 'saldo_conta_poupanca_request_dto.g.dart';

@freezed
class SaldoContaPoupancaRequestDTO with _$SaldoContaPoupancaRequestDTO {
  const factory SaldoContaPoupancaRequestDTO({
    required TipoContaPoupanca tipoContaPoupanca,
  }) = _SaldoContaPoupancaRequestDTO;

  factory SaldoContaPoupancaRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SaldoContaPoupancaRequestDTOFromJson(json);
}
