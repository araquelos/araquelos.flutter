
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancelar_response_dto.freezed.dart';
part 'cancelar_response_dto.g.dart';

@freezed
class CancelarResponseDTO with _$CancelarResponseDTO {
  const factory CancelarResponseDTO({
    required StatusOperacaoEnum valor,
}) = _CancelarResponseDTO;
  factory CancelarResponseDTO.fromJson(Map<String, dynamic> json) => _$CancelarResponseDTOFromJson(json);
}