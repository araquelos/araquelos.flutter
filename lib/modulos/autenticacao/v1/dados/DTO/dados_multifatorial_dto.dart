import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_enum.dart';

part 'dados_multifatorial_dto.freezed.dart';
part 'dados_multifatorial_dto.g.dart';

@freezed
class DadosMultifatorialDTO with _$DadosMultifatorialDTO {
  factory DadosMultifatorialDTO({
    required DateTime dataLimiteUtilizacaoOTP,
    required DateTime dataGlobalLimiteUtilizacaoOTP,
    required bool existeDispositivoHabilitado,
    required bool dataLimiteOtpExpirado,
    required bool dataGlobalLimiteOtpExpirado,
    required TipoAutenticacaoEnum tipoAutenticacao,
    required StatusDispositivoEnum statusDispositivo,
    required bool habilitadoMultifatorial,
    required bool dispositivoPendenteCadastroMultifatorial,
  }) = _DadosMultifatorialDTO;

  factory DadosMultifatorialDTO.fromJson(Map<String, dynamic> json) => _$DadosMultifatorialDTOFromJson(json);
}
