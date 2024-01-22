part of 'home_page_bloc.dart';

class HomePageState extends IEstadoBase<HomePageState> {
  final bool indicadorVisibilidadePublicidade;
  final bool indicadorPossuiMensagensNaoLidas;
  final int quantidadeMensagensNaoLidas;

  HomePageState({
    required this.indicadorVisibilidadePublicidade,
    required this.indicadorPossuiMensagensNaoLidas,
    required this.quantidadeMensagensNaoLidas,
  });

  @override
  HomePageState copyWith({
    bool Function()? indicadorVisibilidadePublicidade,
    bool Function()? indicadorPossuiMensagensNaoLidas,
    int Function()? quantidadeMensagensNaoLidas,
  }) {
    return alterarEstado(
      novaInstancia: HomePageState(
        indicadorVisibilidadePublicidade:
            avaliarFuncao(funcao: indicadorVisibilidadePublicidade, valorAtual: this.indicadorVisibilidadePublicidade),
        indicadorPossuiMensagensNaoLidas:
            avaliarFuncao(funcao: indicadorPossuiMensagensNaoLidas, valorAtual: this.indicadorPossuiMensagensNaoLidas),
        quantidadeMensagensNaoLidas:
            avaliarFuncao(funcao: quantidadeMensagensNaoLidas, valorAtual: this.quantidadeMensagensNaoLidas),
      ),
    );
  }
}
