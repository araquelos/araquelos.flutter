import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/modelos/comprovante.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/internet_banking_bloc_base.dart';
import 'package:path_provider/path_provider.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'package:share_plus/share_plus.dart';

part 'comprovante_event.dart';
part 'comprovante_state.dart';

class ComprovanteBloc extends InternetBankingBlocBase<ComprovanteEvent, ComprovanteState> {
  final String xmlComprovante;

  ComprovanteBloc({
    required this.xmlComprovante,
  }) : super(ComprovanteState(
          etapa: null,
          xmlComprovante: xmlComprovante,
          comprovante: null,
        )) {
    on<ComprovanteEvent>((evento, emit) async {
      switch (evento) {
        case ComprovanteEventIniciar():
          await onIniciar(emit);
        case ComprovanteEventCompartilhar():
          await _onCompartilharComprovante(evento, emit);
        case ComprovanteEventVoltar():
          await _onVoltar(emit);
      }
    });
  }

  @override
  Future<void> onIniciar(Emitter<ComprovanteState> emit) async {
    try {
      Comprovante comprovante = Comprovante.gerarComprovanteXml(state.xmlComprovante);

      emit(state.copyWith(
        etapa: () => EtapaComprovante.etapaExibirComprovante,
        comprovante: () => comprovante,
      ));
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onCompartilharComprovante(
    ComprovanteEventCompartilhar evento,
    Emitter<ComprovanteState> emit,
  ) async {
    try {
      RenderRepaintBoundary boundary = evento.globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 1.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List uint8list = byteData!.buffer.asUint8List();
      Directory tempDir = await getTemporaryDirectory();
      File file = File("${tempDir.path}/comprovante.png");
      await file.writeAsBytes(uint8list);
      Share.shareXFiles([XFile(file.path, mimeType: "image/png")]);
    } on Exception catch (ex) {
      gerenciarExcecao(excecao: ex, emit: emit);
    }
  }

  Future<void> _onVoltar(
    Emitter<ComprovanteState> emit,
  ) async {
    emit(state.redirecionar(rotaDestino: InternetBankingRotas.home));
  }
}
