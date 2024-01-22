import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoAutenticacaoMultifatorialEnum {
  @JsonValue(0)
  sms,
  @JsonValue(1)
  email,
  @JsonValue(2)
  chamadaUra
}
