part of 'assinatura_page.dart';

class EtapaDetalharOperacao extends StatefulWidget {
  const EtapaDetalharOperacao({super.key});

  @override
  State<EtapaDetalharOperacao> createState() => _EtapaDetalharOperacaoState();
}

class _EtapaDetalharOperacaoState extends State<EtapaDetalharOperacao> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssinaturaBloc, AssinaturaState>(
      builder: (context, state) {
        return LayoutPadrao(
          titulo: 'Assinatura',
          subtitulo: state.operacaoSelecionada!.transacao.descricao,
          conteudo: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      switch (state.operacaoSelecionada!.status) {
                        case StatusOperacaoEnum.pendente:
                          if (state.operacaoRevisao!.pendenteAssinaturaUsuarioLogado) {
                            return const ContainerInformativo(
                              texto: "A transação abaixo ainda está pendente de sua assinatura.",
                            );
                          } else {
                            return const ContainerInformativo(
                              texto: "A transação abaixo ainda está pendente de assinaturas.",
                            );
                          }
                        case StatusOperacaoEnum.executado:
                          return const ContainerInformativo(
                            texto: "Veja abaixo os detalhes da transação executada. Nenhuma nova ação é necessária.",
                            tipoContainerInformativo: TipoContainerInformativo.sucesso,
                          );
                        case StatusOperacaoEnum.cancelada:
                          return const ContainerInformativo(
                            texto:
                                "Veja abaixo os detalhes de sua operação cancelada.  Nenhuma nova ação é necessária.",
                            tipoContainerInformativo: TipoContainerInformativo.erro,
                          );
                        case StatusOperacaoEnum.aguardandoExecucao:
                          return const ContainerInformativo(
                            texto: "A transação abaixo ainda está aguardando execução.",
                          );
                        case StatusOperacaoEnum.erroExecucao:
                          return const ContainerInformativo(
                            texto:
                                "Veja abaixo os detalhes de sua operação com erro de execução.  Nenhuma nova ação é necessária.",
                            tipoContainerInformativo: TipoContainerInformativo.erro,
                          );
                      }
                    },
                  ),
                  Column(
                    children: List.generate(
                      state.operacaoRevisao!.lista.length,
                      (index) => ContainerRevisao(
                        titulo: state.operacaoRevisao!.lista[index].titulo,
                        lista: state.operacaoRevisao!.lista[index].lista,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.035,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 239, 239),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              InternetBankingAssetsIcones.cheque,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                InternetBankingCores.azul_500,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              "Assinaturas realizadas",
                              style: TextStyle(
                                color: Color.fromARGB(255, 74, 74, 74),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Visibility(
                          visible: state.operacaoSelecionada!.assinaturas.isNotEmpty,
                          replacement: const Center(
                            child: Text(
                              "Nenhuma assinatura realizada",
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              state.operacaoSelecionada!.assinaturas.length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.005,
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: MediaQuery.of(context).size.height * 0.05,
                                    minWidth: double.infinity,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          state.operacaoSelecionada!.assinaturas[index].nomeUsuario,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Tipo: ${state.operacaoSelecionada!.assinaturas[index].tipoAssinatura.nome}",
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: InternetBankingCores.azul_500,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Em ${DateFormat("dd/MM/yyyy").format(state.operacaoSelecionada!.assinaturas[index].dataHoraRegistro)}, às ${DateFormat("HH:mm").format(state.operacaoSelecionada!.assinaturas[index].dataHoraRegistro)}",
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: InternetBankingCores.azul_500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          rodape: [
            Builder(
              builder: (context) {
                switch (state.operacaoSelecionada!.status) {
                  case StatusOperacaoEnum.pendente:
                    if (state.operacaoRevisao!.pendenteAssinaturaUsuarioLogado) {
                      return Column(
                        children: [
                          Text(
                            "${state.operacaoSelecionada!.assinaturasEfetuadas} assinatura${state.operacaoSelecionada!.assinaturasEfetuadas > 1 ? "s" : ""} de ${state.operacaoSelecionada!.assinaturasNecessarias} necessária${state.operacaoSelecionada!.assinaturasNecessarias > 1 ? "s" : ""}",
                            style: const TextStyle(
                              color: InternetBankingCores.azul_500,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          BotaoSecundario(
                            texto: "Solicitar cancelamento",
                            onPressed: () {
                              context
                                  .read<AssinaturaBloc>()
                                  .add(AssinaturaEventCancelar(idOperacao: state.operacaoSelecionada!.id));
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          BotaoPrincipal(
                            texto: "Assinar transação",
                            onPressed: () {
                              context
                                  .read<AssinaturaBloc>()
                                  .add(AssinaturaEventAssinar(idOperacao: state.operacaoSelecionada!.id));
                            },
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            "${state.operacaoSelecionada!.assinaturasEfetuadas} assinatura${state.operacaoSelecionada!.assinaturasEfetuadas > 1 ? "s" : ""} de ${state.operacaoSelecionada!.assinaturasNecessarias} necessária${state.operacaoSelecionada!.assinaturasNecessarias > 1 ? "s" : ""}",
                            style: const TextStyle(
                              color: InternetBankingCores.azul_500,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          BotaoPrincipal(
                            texto: "Nova consulta",
                            onPressed: () {
                              context.read<AssinaturaBloc>().add(AssinaturaEventVoltar());
                            },
                          ),
                        ],
                      );
                    }
                  case StatusOperacaoEnum.aguardandoExecucao:
                  case StatusOperacaoEnum.executado:
                  case StatusOperacaoEnum.cancelada:
                  case StatusOperacaoEnum.erroExecucao:
                    return BotaoPrincipal(
                      texto: "Nova consulta",
                      onPressed: () {
                        context.read<AssinaturaBloc>().add(AssinaturaEventVoltar());
                      },
                    );
                }
              },
            ),
          ],
          acaoVoltar: () {
            context.read<AssinaturaBloc>().add(AssinaturaEventVoltar());
          },
        );
      },
    );
  }
}
