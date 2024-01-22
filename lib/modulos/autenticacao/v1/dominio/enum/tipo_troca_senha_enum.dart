import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoTrocaSenhaEnum {
  @JsonValue(0)
  primeiroAcesso,
  @JsonValue(1)
  senhaExpirada,
  @JsonValue(2)
  bloqueioSeguranca
}
