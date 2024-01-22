import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginador_dto.freezed.dart';
part 'paginador_dto.g.dart';

@freezed
class PaginadorDTO with _$PaginadorDTO {
  PaginadorDTO._();

  factory PaginadorDTO({
    required int pagina,
    required int totalRegistros,
    required int totalPaginas,
    required int registrosPorPagina,
  }) = _PaginadorDTO;

  factory PaginadorDTO.fromJson(Map<String, dynamic> json) => _$PaginadorDTOFromJson(json);

  PaginadorDTO proximaPagina() {
    int proximaPagina = pagina;
    if (pagina < totalPaginas) proximaPagina++;

    return PaginadorDTO(
      pagina: proximaPagina,
      totalRegistros: totalRegistros,
      totalPaginas: totalPaginas,
      registrosPorPagina: registrosPorPagina,
    );
  }
}
