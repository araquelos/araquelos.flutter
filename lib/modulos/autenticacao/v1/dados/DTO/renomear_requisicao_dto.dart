import 'package:freezed_annotation/freezed_annotation.dart';

part 'renomear_requisicao_dto.freezed.dart';
part 'renomear_requisicao_dto.g.dart';

@freezed
class RenomearRequisicaoDTO with _$RenomearRequisicaoDTO {
  factory RenomearRequisicaoDTO({
    required String canal,
    required int id,
    required String nome,
    required String sistemaOperacional,
    required String marca,
    required String modelo,
    required String? ipUltimoAcesso,
    required DateTime dataHoraUltimoAcesso,
    required bool indicadorNovo,
  }) = _RenomearRequisicaoDTO;

  factory RenomearRequisicaoDTO.fromJson(Map<String, dynamic> json) => _$RenomearRequisicaoDTOFromJson(json);
}
