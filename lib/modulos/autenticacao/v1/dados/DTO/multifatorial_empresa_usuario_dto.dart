import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_enum.dart';

part 'multifatorial_empresa_usuario_dto.freezed.dart';
part 'multifatorial_empresa_usuario_dto.g.dart';

@freezed
class MultifatorialEmpresaUsuarioDTO with _$MultifatorialEmpresaUsuarioDTO {
  factory MultifatorialEmpresaUsuarioDTO({
    required DateTime dataLimiteUtilizacaoOTP,
    required DateTime dataGlobalLimiteUtilizacaoOTP,
    required bool existeDispositivoHabilitado,
    required bool dataLimiteOtpExpirado,
    required bool dataGlobalLimiteOtpExpirado,
    required StatusDispositivoEnum statusDispositivo,
    required bool habilitadoMultifatorial,
    required TipoAutenticacaoEnum tipoAutenticacao,
  }) = _MultifatorialEmpresaUsuarioDTO;

  factory MultifatorialEmpresaUsuarioDTO.fromJson(Map<String, dynamic> json) =>
      _$MultifatorialEmpresaUsuarioDTOFromJson(json);
}
