part of 'extrato_page.dart';

class EtapaExibirTransacoes extends StatelessWidget {
  const EtapaExibirTransacoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtratoBloc, ExtratoState>(
      builder: (context, state) {
        if (state.movimentos.isEmpty) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ContainerListagemVazia(
                mensagem: !state.filtroTipoTransacaoAtivo && state.filtroTextoAtivo == false
                    ? "Nenhum lançamento no período"
                    : "Não há lançamentos correspondentes ao filtro selecionado",
              ),
            ),
          );
        } else {
          return SliverMainAxisGroup(
            slivers: [
              SliverList.builder(
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: ExtratoMovimentoDiario(movimentoDiario: state.movimentos[index]),
                ),
                itemCount: state.movimentos.length,
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                ),
                sliver: SliverList.builder(
                  itemBuilder: (context, index) {
                    if (state.extrato!.itensRodape[index].chave.startsWith('*')) {
                      return ContainerInformativo(texto: state.extrato!.itensRodape[index].chave);
                    }

                    if (!state.extrato!.itensRodape[index].temValor) {
                      return RodapeExtratoTitulo(texto: state.extrato!.itensRodape[index].chave);
                    }

                    return RodapeExtratoValor(item: state.extrato!.itensRodape[index]);
                  },
                  itemCount: state.extrato!.itensRodape.length,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
