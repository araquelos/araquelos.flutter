import 'package:freezed_annotation/freezed_annotation.dart';

part 'obter_extrato_resposta_dto.freezed.dart';
part 'obter_extrato_resposta_dto.g.dart';

@freezed
class ObterExtratoRespostaDTO with _$ObterExtratoRespostaDTO {
  factory ObterExtratoRespostaDTO({
    required String valor,
  }) = _ObterExtratoRespostaDTO;
  factory ObterExtratoRespostaDTO.fromJson(Map<String, dynamic> json) => _$ObterExtratoRespostaDTOFromJson(json);
}
