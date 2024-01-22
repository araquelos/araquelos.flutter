import 'package:freezed_annotation/freezed_annotation.dart';

enum StatusMensagemCaixaPostalEnum {
  @JsonValue(0)
  nova,
  @JsonValue(1)
  lida,
  @JsonValue(2)
  excluida
}
