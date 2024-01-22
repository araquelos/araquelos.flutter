import 'package:freezed_annotation/freezed_annotation.dart';

part 'telefone_dto.freezed.dart';
part 'telefone_dto.g.dart';

@freezed
class TelefoneDTO with _$TelefoneDTO {
  factory TelefoneDTO({
    required String ddd,
    required String numero,
  }) = _TelefoneDTO;

  factory TelefoneDTO.fromJson(Map<String, dynamic> json) => _$TelefoneDTOFromJson(json);
}
