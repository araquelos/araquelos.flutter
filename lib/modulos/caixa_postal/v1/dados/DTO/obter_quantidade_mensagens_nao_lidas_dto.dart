import 'package:freezed_annotation/freezed_annotation.dart';

part 'obter_quantidade_mensagens_nao_lidas_dto.freezed.dart';
part 'obter_quantidade_mensagens_nao_lidas_dto.g.dart';

@freezed
class ObterQuantidadeMensagensNaoLidasDTO with _$ObterQuantidadeMensagensNaoLidasDTO {
  const factory ObterQuantidadeMensagensNaoLidasDTO({
    required int valor,
  }) = _ObterQuantidadeMensagensNaoLidasDTO;

  factory ObterQuantidadeMensagensNaoLidasDTO.fromJson(Map<String, dynamic> json) =>
      _$ObterQuantidadeMensagensNaoLidasDTOFromJson(json);
}
