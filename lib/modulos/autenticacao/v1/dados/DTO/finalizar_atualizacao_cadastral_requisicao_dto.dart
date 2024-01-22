import 'package:freezed_annotation/freezed_annotation.dart';

part 'finalizar_atualizacao_cadastral_requisicao_dto.freezed.dart';
part 'finalizar_atualizacao_cadastral_requisicao_dto.g.dart';

@freezed
class FinalizarAtualizacaoCadastralRequisicaoDTO with _$FinalizarAtualizacaoCadastralRequisicaoDTO {
  factory FinalizarAtualizacaoCadastralRequisicaoDTO({
    required String assinatura,
  }) = _FinalizarAtualizacaoCadastralRequisicaoDTO;

  factory FinalizarAtualizacaoCadastralRequisicaoDTO.fromJson(Map<String, dynamic> json) =>
      _$FinalizarAtualizacaoCadastralRequisicaoDTOFromJson(json);
}
