import 'package:json_annotation/json_annotation.dart';

enum TipoAssinaturaEnum {
  @JsonValue(0)
  assinatura,
  @JsonValue(1)
  cancelamento,
  @JsonValue(2)
  execucaoTransacao;

  String get nome {
    switch (this) {
      case TipoAssinaturaEnum.assinatura:
        return "Assinatura";
      case TipoAssinaturaEnum.cancelamento:
        return "Cancelamento";
      case TipoAssinaturaEnum.execucaoTransacao:
        return "Execução";
    }
  }
}
