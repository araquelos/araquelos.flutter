import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoAutenticacaoEnum {
  @JsonValue(0)
  otp,
  @JsonValue(1)
  multifatorial
}
