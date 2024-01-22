import 'package:flutter/material.dart';
import 'package:mobile_pj/utils/status_processamento.dart';

abstract class IEstadoBase<Estado extends IEstadoBase<Estado>> {
  bool pop = false;

  StatusProcessamento? _statusProcessamento;
  StatusProcessamento? get statusProcessamento => _statusProcessamento;

  String? _tituloMensagem;
  String? get tituloMensagem => _tituloMensagem;

  String? _mensagem;
  String? get mensagem => _mensagem;

  String? _rotaDestino;
  String? get rotaDestino => _rotaDestino;

  Map<String, dynamic>? _parametrosRotaDestino;
  Map<String, dynamic>? get parametrosRotaDestino => _parametrosRotaDestino;

  IEstadoBase();

  Estado copyWith();

  Estado voltar() {
    return this.copyWith()..pop = true;
  }

  Estado exibirModalProcessamento() {
    return this._copyWith(
      statusProcessamento: StatusProcessamento.processando,
    );
  }

  Estado fecharModalProcessamento() {
    return this._copyWith(
      statusProcessamento: StatusProcessamento.processamentoConcluido,
    );
  }

  Estado exibirModalErro({required String mensagem, String? tituloMensagem}) {
    return this._copyWith(
      statusProcessamento: StatusProcessamento.erro,
      tituloMensagem: tituloMensagem,
      mensagem: mensagem,
    );
  }

  Estado exibirModalSucesso({required String mensagem}) {
    return this._copyWith(
      statusProcessamento: StatusProcessamento.sucesso,
      mensagem: mensagem,
    );
  }

  Estado redirecionar({required String rotaDestino, Map<String, dynamic>? parametros}) {
    return this._copyWith(
      rotaDestino: rotaDestino,
      parametrosRotaDestino: parametros,
    );
  }

  Estado _copyWith({
    StatusProcessamento? statusProcessamento,
    String? tituloMensagem,
    String? mensagem,
    String? rotaDestino,
    Map<String, dynamic>? parametrosRotaDestino,
  }) {
    return this.copyWith()
      .._statusProcessamento = statusProcessamento
      .._tituloMensagem = tituloMensagem
      .._mensagem = mensagem
      .._rotaDestino = rotaDestino
      .._parametrosRotaDestino = parametrosRotaDestino
      ..pop = this.pop;
  }

  @protected
  Estado alterarEstado({required Estado novaInstancia}) {
    return novaInstancia..pop = this.pop;
  }

  @protected
  dynamic avaliarFuncao({required dynamic Function()? funcao, required dynamic valorAtual}) {
    return funcao != null ? funcao() : valorAtual;
  }
}

abstract class IEstadoComEtapa<Estado extends IEstadoBase<Estado>, Etapa extends Enum> extends IEstadoBase<Estado> {
  Etapa? etapa;

  IEstadoComEtapa({required this.etapa});
}
