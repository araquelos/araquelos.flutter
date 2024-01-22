import 'package:freezed_annotation/freezed_annotation.dart';

part "excluir_mensagens_dto.freezed.dart";
part "excluir_mensagens_dto.g.dart";

@freezed
class ExcluirMensagensDTO with _$ExcluirMensagensDTO {
  const factory ExcluirMensagensDTO({
    required String respostaPadrao,
  }) = _ExcluirMensagensDTO;

  factory ExcluirMensagensDTO.fromJson(Map<String, dynamic> json) => _$ExcluirMensagensDTOFromJson(json);
}
