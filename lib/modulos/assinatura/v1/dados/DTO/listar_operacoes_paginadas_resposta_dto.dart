import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_minificada_dto.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

part 'listar_operacoes_paginadas_resposta_dto.freezed.dart';
part 'listar_operacoes_paginadas_resposta_dto.g.dart';

@freezed
class ListarOperacoesPaginadasRespostaDTO with _$ListarOperacoesPaginadasRespostaDTO {
  factory ListarOperacoesPaginadasRespostaDTO({
    required List<OperacaoMinificadaDTO> lista,
    required PaginadorDTO paginador,
  }) = _ListarOperacoesPaginadasRespostaDTO;

  factory ListarOperacoesPaginadasRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$ListarOperacoesPaginadasRespostaDTOFromJson(json);
}
