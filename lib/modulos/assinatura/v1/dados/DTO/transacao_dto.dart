import 'package:freezed_annotation/freezed_annotation.dart';

part 'transacao_dto.freezed.dart';
part 'transacao_dto.g.dart';

@freezed
class TransacaoDTO with _$TransacaoDTO {
  factory TransacaoDTO({
    required String codigo,
    required String descricao,
  }) = _TransacaoDTO;

  factory TransacaoDTO.fromJson(Map<String, dynamic> json) => _$TransacaoDTOFromJson(json);
}
