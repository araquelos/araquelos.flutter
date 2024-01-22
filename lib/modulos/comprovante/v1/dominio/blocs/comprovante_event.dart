part of 'comprovante_bloc.dart';

sealed class ComprovanteEvent extends ReplayEvent {}

class ComprovanteEventIniciar extends ComprovanteEvent {}

class ComprovanteEventCompartilhar extends ComprovanteEvent {
  final GlobalKey globalKey;

  ComprovanteEventCompartilhar({required this.globalKey});
}

class ComprovanteEventVoltar extends ComprovanteEvent {}
