import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispositivo_dto.freezed.dart';
part 'dispositivo_dto.g.dart';

@freezed
class DispositivoDTO with _$DispositivoDTO {
  factory DispositivoDTO({
    required String canal,
    required int id,
    required String nome,
    required String sistemaOperacional,
    required String marca,
    required String modelo,
    required String? ipUltimoAcesso,
    required String dataHoraUltimoAcesso,
    required bool indicadorNovo,
  }) = _DispositivoDTO;

  factory DispositivoDTO.fromJson(Map<String, dynamic> json) => _$DispositivoDTOFromJson(json);
}
