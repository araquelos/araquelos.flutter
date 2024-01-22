import 'package:freezed_annotation/freezed_annotation.dart';

part 'obter_xml_por_operacao_resposta_dto.freezed.dart';
part 'obter_xml_por_operacao_resposta_dto.g.dart';

@freezed
class ObterXmlPorOperacaoRespostaDTO with _$ObterXmlPorOperacaoRespostaDTO {
  factory ObterXmlPorOperacaoRespostaDTO({
    required String valor,
  }) = _ObterXmlPorOperacaoRespostaDTO;

  factory ObterXmlPorOperacaoRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$ObterXmlPorOperacaoRespostaDTOFromJson(json);
}
