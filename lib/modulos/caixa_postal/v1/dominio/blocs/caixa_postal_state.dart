part of 'caixa_postal_bloc.dart';

enum CaixaPostalEtapa { exibirListaMensagens, aguardandoFimRequisicao }

class CaixaPostalState extends IEstadoComEtapa<CaixaPostalState, CaixaPostalEtapa> {
  final List<MensagemDTO>? listaMensagens;
  final MensagemDTO? mensagemSelecionada;
  final List<MensagemDTO> listaMensagensSelecionadas;
  final MensagemDTO? mensagemLida;

  CaixaPostalState(
      {required super.etapa,
      required this.listaMensagens,
      required this.mensagemSelecionada,
      required this.listaMensagensSelecionadas,
      required this.mensagemLida});

  @override
  CaixaPostalState copyWith(
      {CaixaPostalEtapa? Function()? etapa,
      List<MensagemDTO>? Function()? listaMensagem,
      MensagemDTO? Function()? mensagemSelecionada,
      List<MensagemDTO>? Function()? listaMensagensSelecionadas,
      MensagemDTO? Function()? mensagemLida}) {
    return alterarEstado(
      novaInstancia: CaixaPostalState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        listaMensagens: avaliarFuncao(funcao: listaMensagem, valorAtual: listaMensagens),
        mensagemSelecionada: avaliarFuncao(funcao: mensagemSelecionada, valorAtual: mensagem),
        listaMensagensSelecionadas:
            avaliarFuncao(funcao: listaMensagensSelecionadas, valorAtual: this.listaMensagensSelecionadas),
        mensagemLida: avaliarFuncao(funcao: mensagemLida, valorAtual: this.mensagemLida),
      ),
    );
  }
}
