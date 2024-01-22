import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

part 'listar_operacoes_requisicao_dto.freezed.dart';
part 'listar_operacoes_requisicao_dto.g.dart';

@freezed
class ListarOperacoesRequisicaoDTO with _$ListarOperacoesRequisicaoDTO {
  factory ListarOperacoesRequisicaoDTO({
    required FiltroAssinaturaTipoTransacaoEnum filtro,
    required PaginadorDTO paginador,
  }) = _ListarOperacoesRequisicaoDTO;

  factory ListarOperacoesRequisicaoDTO.fromJson(Map<String, dynamic> json) =>
      _$ListarOperacoesRequisicaoDTOFromJson(json);
}
