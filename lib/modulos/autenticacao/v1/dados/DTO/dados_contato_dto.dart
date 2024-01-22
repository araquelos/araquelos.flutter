import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/telefone_dto.dart';

part 'dados_contato_dto.freezed.dart';
part 'dados_contato_dto.g.dart';

@freezed
class DadosContatoDTO with _$DadosContatoDTO {
  factory DadosContatoDTO({required String email, required TelefoneDTO telefone}) = _DadosContatoDTO;

  factory DadosContatoDTO.fromJson(Map<String, dynamic> json) => _$DadosContatoDTOFromJson(json);
}
