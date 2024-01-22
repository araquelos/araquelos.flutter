import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_multifatorial_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_acesso_empresa_enum.dart';

part 'acesso_empresa_dto.freezed.dart';
part 'acesso_empresa_dto.g.dart';

@freezed
class AcessoEmpresaDTO with _$AcessoEmpresaDTO {
  factory AcessoEmpresaDTO(
      {required String cnpj,
      required String nome,
      required bool usuarioMaster,
      required TipoAcessoEmpresaEnum status,
      required DadosMultifatorialDTO? dadosMultifatorial,
      required List<ContaDTO>? contas,
      required ContaDTO? contaSelecionada}) = _AcessoEmpresaDTO;

  factory AcessoEmpresaDTO.fromJson(Map<String, dynamic> json) => _$AcessoEmpresaDTOFromJson(json);
}
