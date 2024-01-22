import 'package:json_annotation/json_annotation.dart';

enum TipoContaEnum {
  @JsonValue(0)
  contaCorrente,
  @JsonValue(1)
  contaPoupanca
}
