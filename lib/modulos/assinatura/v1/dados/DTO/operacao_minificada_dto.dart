import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operacao_minificada_dto.freezed.dart';
part 'operacao_minificada_dto.g.dart';

@freezed
class OperacaoMinificadaDTO with _$OperacaoMinificadaDTO {
  factory OperacaoMinificadaDTO({
    required int id,
    required String descricao,
    required DateTime dataHoraRegistro,
    required double valor,
    required StatusOperacaoEnum status,
    required int assinaturasNecessarias,
    required int assinaturasEfetuadas,
  }) = _OperacaoMinificadaDTO;

  factory OperacaoMinificadaDTO.fromJson(Map<String, dynamic> json) => _$OperacaoMinificadaDTOFromJson(json);
}
