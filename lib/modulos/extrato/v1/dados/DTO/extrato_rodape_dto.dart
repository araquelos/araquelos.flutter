import 'package:freezed_annotation/freezed_annotation.dart';

part 'extrato_rodape_dto.freezed.dart';
part 'extrato_rodape_dto.g.dart';

@freezed
class ExtratoRodapeDTO with _$ExtratoRodapeDTO {
  factory ExtratoRodapeDTO({required String chave, required String valor, required bool temValor}) = _ExtratoRodapeDTO;
  factory ExtratoRodapeDTO.fromJson(Map<String, dynamic> json) => _$ExtratoRodapeDTOFromJson(json);
}
