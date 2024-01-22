import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoAcessoEmpresaEnum {
  @JsonValue(0)
  ativo,
  @JsonValue(1)
  bloqueado,
  @JsonValue(2)
  aguardandoAprovacaoMaster,
  @JsonValue(3)
  aguardandoAprovacaoAgencia,
  @JsonValue(4)
  desativado,
  @JsonValue(5)
  senhaNaoCadastradaAgencia
}
