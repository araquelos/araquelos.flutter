import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';

part 'selecionar_conta_requisicao_dto.freezed.dart';
part 'selecionar_conta_requisicao_dto.g.dart';

@freezed
class SelecionarContaRequisicaoDTO with _$SelecionarContaRequisicaoDTO {
  factory SelecionarContaRequisicaoDTO({
    required String cnpj,
    required int agencia,
    required int numeroConta,
    required TipoContaEnum tipoConta,
    required int titularidade,
  }) = _SelecionarContaRequisicaoDTO;

  factory SelecionarContaRequisicaoDTO.fromJson(Map<String, dynamic> json) =>
      _$SelecionarContaRequisicaoDTOFromJson(json);
}
