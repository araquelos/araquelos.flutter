import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/enum/tipo_conta_poupanca_enum.dart';

part 'obter_extrato_requisicao_dto.freezed.dart';
part 'obter_extrato_requisicao_dto.g.dart';

@freezed
class ObterExtratoRequisicaoDTO with _$ObterExtratoRequisicaoDTO {
  factory ObterExtratoRequisicaoDTO({
    required DateTime dataInicial,
    required DateTime dataFinal,
    required TipoContaPoupanca? tipoContaPoupanca,
  }) = _ObterExtratoRequisicaoDTO;

  factory ObterExtratoRequisicaoDTO.fromJson(Map<String, dynamic> json) => _$ObterExtratoRequisicaoDTOFromJson(json);
}
