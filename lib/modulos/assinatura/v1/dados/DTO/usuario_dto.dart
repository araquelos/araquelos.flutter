import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_dto.freezed.dart';
part 'usuario_dto.g.dart';

@freezed
class UsuarioDTO with _$UsuarioDTO {
  factory UsuarioDTO({
    required String cpf,
    required String nome,
  }) = _UsuarioDTO;

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) => _$UsuarioDTOFromJson(json);
}
