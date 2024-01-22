import 'package:freezed_annotation/freezed_annotation.dart';

part 'iniciar_atualizacao_cadastral_resposta_dto.freezed.dart';
part 'iniciar_atualizacao_cadastral_resposta_dto.g.dart';

@freezed
class IniciarAtualizacaoCadastralRespostaDTO with _$IniciarAtualizacaoCadastralRespostaDTO {
  factory IniciarAtualizacaoCadastralRespostaDTO({
    required String assinatura,
    required int tempoValidade,
  }) = _IniciarAtualizacaoCadastralRespostaDTO;

  factory IniciarAtualizacaoCadastralRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$IniciarAtualizacaoCadastralRespostaDTOFromJson(json);
}
