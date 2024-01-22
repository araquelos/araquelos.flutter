import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_multifatorial_dto.dart';

part 'detalhar_empresa_resposta_dto.freezed.dart';
part 'detalhar_empresa_resposta_dto.g.dart';

@freezed
class DetalharEmpresaRespostaDTO with _$DetalharEmpresaRespostaDTO {
  factory DetalharEmpresaRespostaDTO({
    required String cnpj,
    required DadosMultifatorialDTO? multifatorialEmpresaUsuario,
    required List<ContaDTO> contas,
  }) = _DetalharEmpresaRespostaDTO;

  factory DetalharEmpresaRespostaDTO.fromJson(Map<String, dynamic> json) => _$DetalharEmpresaRespostaDTOFromJson(json);
}
