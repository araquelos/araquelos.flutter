import 'package:json_annotation/json_annotation.dart';

enum TipoDadoOperacaoEnum {
  @JsonValue(0)
  label,
  @JsonValue(1)
  info,
  @JsonValue(2)
  breakLine
}
