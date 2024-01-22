import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/dado_operacao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_assinatura_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/usuario_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';

part 'operacao_detalhada_resposta_dto.freezed.dart';
part 'operacao_detalhada_resposta_dto.g.dart';

@freezed
class OperacaoDetalhadaRespostaDTO with _$OperacaoDetalhadaRespostaDTO {
  factory OperacaoDetalhadaRespostaDTO({
    required int id,
    required String descricao,
    required DateTime dataHoraRegistro,
    required double valor,
    required StatusOperacaoEnum status,
    required TransacaoDTO transacao,
    required UsuarioDTO? usuarioRegistro,
    required int assinaturasNecessarias,
    required int assinaturasEfetuadas,
    required List<OperacaoAssinaturaDTO> assinaturas,
    required List<DadoOperacaoDTO> dados,
  }) = _OperacaoDetalhadaRespostaDTO;

  factory OperacaoDetalhadaRespostaDTO.fromJson(Map<String, dynamic> json) =>
      _$OperacaoDetalhadaRespostaDTOFromJson(json);
}
