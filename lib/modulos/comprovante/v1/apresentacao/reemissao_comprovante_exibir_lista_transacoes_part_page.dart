part of 'reemissao_comprovante_page.dart';

class EtapaExibirListaTransacoes extends StatelessWidget {
  const EtapaExibirListaTransacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReemissaoComprovanteBloc, ReemissaoComprovanteState>(
      builder: (context, state) {
        return Column(
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
            Builder(
              builder: (context) {
                if (state.listaTransacoesFiltrada!.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: const ContainerListagemVazia(
                          mensagem: "Não existem transações correspondentes ao filtro selecionado",
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
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
                        return InkWell(
                          onTap: () => context.read<ReemissaoComprovanteBloc>().add(
                                ReemissaoComprovanteEventSelecionarTransacao(
                                  transacaoSelecionada: state.listaTransacoesFiltrada![index],
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
                                Text(
                                  state.listaTransacoesFiltrada![index].descricao,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 43, 43),
                                  ),
                                ),
                                const Spacer(),
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
                      itemCount: state.listaTransacoesFiltrada!.length,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
