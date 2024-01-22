import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_dado_operacao_enum.dart';

part 'dado_operacao_dto.freezed.dart';
part 'dado_operacao_dto.g.dart';

@freezed
class DadoOperacaoDTO with _$DadoOperacaoDTO {
  factory DadoOperacaoDTO({
    required String chave,
    required String? valor,
    required TipoDadoOperacaoEnum tipo,
  }) = _DadoOperacaoDTO;

  factory DadoOperacaoDTO.fromJson(Map<String, dynamic> json) => _$DadoOperacaoDTOFromJson(json);
}
