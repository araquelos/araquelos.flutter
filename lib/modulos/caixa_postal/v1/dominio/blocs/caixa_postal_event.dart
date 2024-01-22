part of 'caixa_postal_bloc.dart';

@immutable
sealed class CaixaPostalEvent extends ReplayEvent {}

class CaixaPostalEventIniciar extends CaixaPostalEvent {}

class CaixaPostalEventMarcarMensagemComoLida extends CaixaPostalEvent {
  final MensagemDTO mensagemSelecionada;

  CaixaPostalEventMarcarMensagemComoLida({
    required this.mensagemSelecionada,
  });
}

class CaixaPostalEventExcluirMensagem extends CaixaPostalEvent {
  final List<int> idsMensagens;

  CaixaPostalEventExcluirMensagem({required this.idsMensagens});
}
