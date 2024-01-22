
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buscar_quantidade_response_dto.freezed.dart';
part 'buscar_quantidade_response_dto.g.dart';

@freezed
class BuscarQuantidadeResponseDTO with _$BuscarQuantidadeResponseDTO{
  const factory BuscarQuantidadeResponseDTO({
    required int valor,
}) = _BuscarQuantidadeResponseDTO;

  factory BuscarQuantidadeResponseDTO.fromJson(Map<String, dynamic> json) => _$BuscarQuantidadeResponseDTOFromJson(json);
}