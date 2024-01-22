import 'package:json_annotation/json_annotation.dart';

enum FiltroAssinaturaTipoTransacaoEnum {
  @JsonValue(0)
  pendentes,
  @JsonValue(1)
  assinadasPorMim,
  @JsonValue(2)
  naoAssinadasPorMim,
  @JsonValue(3)
  canceladas,
  @JsonValue(4)
  executadas,
  @JsonValue(5)
  erroExecucao,
  @JsonValue(6)
  aguardandoExecucao,
  @JsonValue(7)
  todas;

  String get nome {
    switch (this) {
      case FiltroAssinaturaTipoTransacaoEnum.pendentes:
        return "PENDENTES";
      case FiltroAssinaturaTipoTransacaoEnum.assinadasPorMim:
        return "ASSINADAS POR MIM";
      case FiltroAssinaturaTipoTransacaoEnum.naoAssinadasPorMim:
        return "NÃO ASSINADAS POR MIM";
      case FiltroAssinaturaTipoTransacaoEnum.canceladas:
        return "CANCELADAS";
      case FiltroAssinaturaTipoTransacaoEnum.executadas:
        return "EXECUTADAS";
      case FiltroAssinaturaTipoTransacaoEnum.erroExecucao:
        return "ERRO DE EXECUÇÃO";
      case FiltroAssinaturaTipoTransacaoEnum.aguardandoExecucao:
        return "AGUARDANDO EXECUÇÃO";
      case FiltroAssinaturaTipoTransacaoEnum.todas:
        return "TODAS";
    }
  }
}
