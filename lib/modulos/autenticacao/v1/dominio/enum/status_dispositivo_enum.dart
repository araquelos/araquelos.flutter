import 'package:freezed_annotation/freezed_annotation.dart';

enum StatusDispositivoEnum {
  @JsonValue(0)
  bloqueado,
  @JsonValue(1)
  expirado,
  @JsonValue(2)
  pendenteHabilitacao,
  @JsonValue(3)
  habilitado,
  @JsonValue(4)
  naoAssociado,
  @JsonValue(5)
  inutilizavel
}
