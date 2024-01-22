import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/enum/status_mensagem_caixa_postal.dart';

part 'mensagem_dto.freezed.dart';
part 'mensagem_dto.g.dart';

@freezed
class MensagemDTO with _$MensagemDTO {
  const factory MensagemDTO({
    required int id,
    required String? titulo,
    required DateTime dataHoraEnvio,
    required String? descricao,
    required StatusMensagemCaixaPostalEnum status,
  }) = _MensagemDTO;

  factory MensagemDTO.fromJson(Map<String, dynamic> json) => _$MensagemDTOFromJson(json);
}
