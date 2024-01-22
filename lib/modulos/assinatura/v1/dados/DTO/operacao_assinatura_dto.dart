import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_assinatura_enum.dart';

part 'operacao_assinatura_dto.freezed.dart';
part 'operacao_assinatura_dto.g.dart';

@freezed
class OperacaoAssinaturaDTO with _$OperacaoAssinaturaDTO {
  factory OperacaoAssinaturaDTO({
    required String cpfUsuario,
    required String nomeUsuario,
    required TipoAssinaturaEnum tipoAssinatura,
    required DateTime dataHoraRegistro,
  }) = _OperacaoAssinaturaDTO;

  factory OperacaoAssinaturaDTO.fromJson(Map<String, dynamic> json) => _$OperacaoAssinaturaDTOFromJson(json);
}
