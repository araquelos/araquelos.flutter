import 'package:json_annotation/json_annotation.dart';

enum StatusOperacaoEnum {
  @JsonValue(0)
  pendente,
  @JsonValue(1)
  executado,
  @JsonValue(2)
  cancelada,
  @JsonValue(3)
  aguardandoExecucao,
  @JsonValue(4)
  erroExecucao
}
