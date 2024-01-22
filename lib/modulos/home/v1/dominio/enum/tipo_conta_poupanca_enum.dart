import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoContaPoupanca {
  @JsonValue(0)
  antiga,
  @JsonValue(1)
  nova,
}
