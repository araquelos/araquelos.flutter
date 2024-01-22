import 'package:freezed_annotation/freezed_annotation.dart';

part 'excluir_mensagens_requisicao_dto.freezed.dart';
part 'excluir_mensagens_requisicao_dto.g.dart';

@freezed
class ExcluirMensagensRequisicaoDTO with _$ExcluirMensagensRequisicaoDTO {
  const factory ExcluirMensagensRequisicaoDTO({required List<int> idsMensagens}) = _ExcluirMensagensRequisicaoDTO;

  factory ExcluirMensagensRequisicaoDTO.fromJson(Map<String, dynamic> json) =>
      _$ExcluirMensagensRequisicaoDTOFromJson(json);
}
