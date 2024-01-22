import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_troca_senha_enum.dart';

part 'autenticar_resposta_dto.freezed.dart';
part 'autenticar_resposta_dto.g.dart';

@freezed
class AutenticarRespostaDTO with _$AutenticarRespostaDTO {
  const factory AutenticarRespostaDTO(
      {required String codigoSessao,
      required String cpf,
      required String nome,
      required List<AcessoEmpresaDTO> empresas,
      required AcessoEmpresaDTO? empresaSelecionada,
      required DadosContatoDTO? dadosContato,
      required DispositivoDTO dispositivo,
      required bool indicadorTermoResponsabilidade,
      required bool indicadorAtualizacaoCadastral,
      required bool indicadorTrocaSenha,
      required TipoTrocaSenhaEnum? motivoTrocaSenha}) = _AutenticarRespostaDTO;

  factory AutenticarRespostaDTO.fromJson(Map<String, dynamic> json) => _$AutenticarRespostaDTOFromJson(json);
}
