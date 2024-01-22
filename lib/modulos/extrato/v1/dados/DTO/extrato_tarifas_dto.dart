import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/DTO/movimento_dto.dart';

part 'extrato_tarifas_dto.freezed.dart';
part 'extrato_tarifas_dto.g.dart';

@freezed
class ExtratoTarifasDTO with _$ExtratoTarifasDTO {
factory  ExtratoTarifasDTO({
    required int agencia,
    required int conta,
    required String nome,
    required String dataInicio,
    required String dataFim,
    required List<MovimentoDTO> movimentos,
    required double total,
    required String html
  }) = _ExtratoTarifasDTO;
factory ExtratoTarifasDTO.fromJson(Map<String, dynamic> json) => _$ExtratoTarifasDTOFromJson(json);
}