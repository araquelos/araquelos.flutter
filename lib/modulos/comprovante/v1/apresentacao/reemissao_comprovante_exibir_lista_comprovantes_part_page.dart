part of 'reemissao_comprovante_page.dart';

class EtapaExibirListaComprovantes extends StatelessWidget {
  const EtapaExibirListaComprovantes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReemissaoComprovanteBloc, ReemissaoComprovanteState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Busca(
                funcao: (texto) => context.read<ReemissaoComprovanteBloc>().add(
                      ReemissaoComprovanteEventAlterarFiltro(filtro: texto),
                    ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: const Text(
                "Comprovantes encontrados",
                style: TextStyle(
                  color: InternetBankingCores.azul_500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (state.listaComprovantesFiltrada!.isEmpty) {
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const ContainerListagemVazia(
                        mensagem: "Não existem transações correspondentes ao filtro selecionado",
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 228, 231, 236),
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    if (index == state.listaComprovantesFiltrada!.length &&
                        state.paginador.pagina < state.paginador.totalPaginas) {
                      if (state.filtroComprovanteAtivo) return Container();
                      context.read<ReemissaoComprovanteBloc>().add(ReemissaoComprovanteEventAvancarPagina());
                      return Shimmer.fromColors(
                        baseColor: InternetBankingCores.cinza_300,
                        highlightColor: InternetBankingCores.cinza_500,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                            horizontal: MediaQuery.of(context).size.width * 0.05,
                          ),
                          color: const Color.fromARGB(90, 255, 255, 255),
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () => context.read<ReemissaoComprovanteBloc>().add(
                            ReemissaoComprovanteEventSelecionarComprovante(
                              comprovanteSelecionado: state.listaComprovantesFiltrada![index],
                            ),
                          ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 108, 113, 174),
                                borderRadius: BorderRadius.circular(7.5),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  InternetBankingAssetsIcones.extrato,
                                  height: 15,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.075,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Em ${DateFormat("dd/MM/yyyy").format(state.listaComprovantesFiltrada![index].dataHoraRegistro)}, às ${DateFormat("HH:mm").format(state.listaComprovantesFiltrada![index].dataHoraRegistro)}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 43, 43),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  state.listaComprovantesFiltrada![index].descricao,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 43, 43),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              UtilBrasilFields.obterReal(state.listaComprovantesFiltrada![index].valor),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 43, 43, 43),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025,
                            ),
                            SvgPicture.asset(
                              InternetBankingAssetsIcones.setaDireita,
                              height: 15,
                              colorFilter: const ColorFilter.mode(
                                InternetBankingCores.azul_500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.listaComprovantesFiltrada!.length +
                      (state.paginador.pagina < state.paginador.totalPaginas ? 1 : 0),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
