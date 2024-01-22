import 'package:freezed_annotation/freezed_annotation.dart';

part 'associar_dispositivo_multifatorial_resposta_dto.freezed.dart';
part 'associar_dispositivo_multifatorial_resposta_dto.g.dart';

@freezed
class AssociarDispositivoMultifatorialRespostaDTO with _$AssociarDispositivoMultifatorialRespostaDTO {
  factory AssociarDispositivoMultifatorialRespostaDTO({
    required DateTime dataExpiracao,
    required bool dataExpirada,
  }) = _AssociarDispositivoMultifatorialRespostaDTO;

  factory AssociarDispositivoMultifatorialRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$AssociarDispositivoMultifatorialRespostaDTOFromJson(json);
}
