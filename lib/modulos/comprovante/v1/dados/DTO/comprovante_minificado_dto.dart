import 'package:freezed_annotation/freezed_annotation.dart';

part 'comprovante_minificado_dto.freezed.dart';
part 'comprovante_minificado_dto.g.dart';

@freezed
class ComprovanteMinificadoDTO with _$ComprovanteMinificadoDTO {
  factory ComprovanteMinificadoDTO({
    required double valor,
    required DateTime dataHoraRegistro,
    required String descricao,
    required String html,
    required String xml,
  }) = _ComprovanteMinificadoDTO;

  factory ComprovanteMinificadoDTO.fromJson(Map<String, dynamic> json) => _$ComprovanteMinificadoDTOFromJson(json);
}
