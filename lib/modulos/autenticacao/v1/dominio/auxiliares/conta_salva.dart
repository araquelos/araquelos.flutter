import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';

part 'conta_salva.freezed.dart';
part 'conta_salva.g.dart';

@freezed
class ContaSalva with _$ContaSalva {
  const factory ContaSalva({
    required String nome,
    required String cpf,
    required String? senha,
    required String nomeDispositivo,
    required bool dispositivoGeradorToken,
    required bool autenticarComDigital,
    required List<AcessoEmpresaDTO> empresas,
  }) = _ContaSalva;

  factory ContaSalva.fromJson(Map<String, dynamic> json) => _$ContaSalvaFromJson(json);
}
