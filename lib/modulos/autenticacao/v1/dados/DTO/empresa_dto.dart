import 'package:freezed_annotation/freezed_annotation.dart';

part 'empresa_dto.freezed.dart';
part 'empresa_dto.g.dart';

@freezed
class EmpresaDTO with _$EmpresaDTO {
  factory EmpresaDTO({
    required String cnpj,
    required String nome,
  }) = _EmpresaDTO;

  factory EmpresaDTO.fromJson(Map<String, dynamic> json) => _$EmpresaDTOFromJson(json);
}
