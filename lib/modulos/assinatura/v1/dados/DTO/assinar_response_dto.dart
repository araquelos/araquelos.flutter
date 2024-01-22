import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';

part 'assinar_response_dto.freezed.dart';
part 'assinar_response_dto.g.dart';

@freezed
class AssinarResponseDTO with _$AssinarResponseDTO {
  const factory AssinarResponseDTO({
    required StatusOperacaoEnum valor,
  }) = _AssinarResponseDTO;

  factory AssinarResponseDTO.fromJson(Map<String, dynamic> json) => _$AssinarResponseDTOFromJson(json);
}
