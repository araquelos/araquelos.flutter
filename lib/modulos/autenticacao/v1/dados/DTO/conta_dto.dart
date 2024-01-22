import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';

part 'conta_dto.freezed.dart';
part 'conta_dto.g.dart';

@freezed
class ContaDTO with _$ContaDTO {
  factory ContaDTO(
      {required int agencia,
      required int numeroConta,
      required TipoContaEnum tipoConta,
      required int titularidade}) = _ContaDTO;

  factory ContaDTO.fromJson(Map<String, dynamic> json) => _$ContaDTOFromJson(json);
}
