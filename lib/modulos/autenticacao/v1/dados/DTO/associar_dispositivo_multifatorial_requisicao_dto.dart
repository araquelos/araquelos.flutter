import 'package:freezed_annotation/freezed_annotation.dart';

part 'associar_dispositivo_multifatorial_requisicao_dto.freezed.dart';
part 'associar_dispositivo_multifatorial_requisicao_dto.g.dart';

@freezed
class AssociarDispositivoMultifatorialRequisicaoDTO with _$AssociarDispositivoMultifatorialRequisicaoDTO {
  factory AssociarDispositivoMultifatorialRequisicaoDTO({
    required String idMultifatorial,
    required String cnpj,
  }) = _AssociarDispositivoMultifatorialRequisicaoDTO;

  factory AssociarDispositivoMultifatorialRequisicaoDTO.fromJson(Map<String, dynamic> json) =>
      _$AssociarDispositivoMultifatorialRequisicaoDTOFromJson(json);
}
