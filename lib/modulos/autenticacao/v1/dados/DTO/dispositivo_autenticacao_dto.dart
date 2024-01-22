import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispositivo_autenticacao_dto.freezed.dart';
part 'dispositivo_autenticacao_dto.g.dart';

@freezed
class DispositivoAutenticacaoDTO with _$DispositivoAutenticacaoDTO {
  factory DispositivoAutenticacaoDTO({
    required String id,
    required String nome,
    required String sistemaOperacional,
    required String marca,
    required String modelo,
  }) = _DispositivoAutenticacaoDTO;

  factory DispositivoAutenticacaoDTO.fromJson(Map<String, dynamic> json) => _$DispositivoAutenticacaoDTOFromJson(json);
}
