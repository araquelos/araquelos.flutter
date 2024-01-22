import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/comprovante_minificado_dto.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

part 'obter_comprovantes_paginados_resposta_dto.freezed.dart';
part 'obter_comprovantes_paginados_resposta_dto.g.dart';

@freezed
class ObterComprovantesPaginadosRespostaDTO with _$ObterComprovantesPaginadosRespostaDTO {
  factory ObterComprovantesPaginadosRespostaDTO({
    required List<ComprovanteMinificadoDTO> lista,
    required PaginadorDTO paginador,
  }) = _RespostaListaComprovanteMinificadoDTO;

  factory ObterComprovantesPaginadosRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$ObterComprovantesPaginadosRespostaDTOFromJson(json);
}
