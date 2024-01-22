import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_autenticacao_dto.dart';

part 'autenticar_requisicao_dto.freezed.dart';
part 'autenticar_requisicao_dto.g.dart';

@freezed
class AutenticarRequisicaoDTO with _$AutenticarRequisicaoDTO {
  factory AutenticarRequisicaoDTO({
    required String cpf,
    required String senha,
    required DispositivoAutenticacaoDTO dispositivo,
  }) = _AutenticarRequisicaoDTO;

  factory AutenticarRequisicaoDTO.fromJson(Map<String, dynamic> json) => _$AutenticarRequisicaoDTOFromJson(json);
}
