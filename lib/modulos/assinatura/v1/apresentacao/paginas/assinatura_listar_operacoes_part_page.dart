part of 'assinatura_page.dart';

class EtapaListarOperacoes extends StatefulWidget {
  const EtapaListarOperacoes({super.key});

  @override
  State<EtapaListarOperacoes> createState() => _EtapaListarOperacoesState();
}

class _EtapaListarOperacoesState extends State<EtapaListarOperacoes> {
  var botoesAssinaturaSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssinaturaBloc, AssinaturaState>(
      builder: (context, state) {
        return SliverMainAxisGroup(
          slivers: [
            Builder(
              builder: (context) {
                if (state.listaOperacoes.isEmpty) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const ContainerListagemVazia(
                        mensagem: "Não há operações correspondentes ao filtro selecionado",
                      ),
                    ),
                  );
                } else {
                  return SliverList.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    itemCount:
                        state.listaOperacoes.length + (state.paginador.pagina < state.paginador.totalPaginas ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.listaOperacoes.length &&
                          state.paginador.pagina < state.paginador.totalPaginas) {
                        //if (state.filtroComprovanteAtivo) return Container();
                        context.read<AssinaturaBloc>().add(AssinaturaEventAvancarPagina());
                        return Shimmer.fromColors(
                          baseColor: InternetBankingCores.cinza_300,
                          highlightColor: InternetBankingCores.cinza_500,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.04,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(90, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }

                      return CardAssinatura(
                        caminhoSvg: InternetBankingAssetsIcones.cheque,
                        corSvg: InternetBankingCores.azul_500,
                        valor: UtilBrasilFields.obterReal(state.listaOperacoes[index].valor),
                        rotulo: state.listaOperacoes[index].descricao,
                        data: state.listaOperacoes[index].dataHoraRegistro,
                        grupo: botoesAssinaturaSizeGroup,
                        aoClicar: () {
                          context
                              .read<AssinaturaBloc>()
                              .add(AssinaturaEventSelecionarOperacao(operacaoSelecionada: state.listaOperacoes[index]));
                        },
                      );
                    },
                  );
                }
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ],
        );
      },
    );
  }
}
