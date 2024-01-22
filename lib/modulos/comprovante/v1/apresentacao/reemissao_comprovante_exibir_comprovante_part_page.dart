part of 'reemissao_comprovante_page.dart';

class EtapaExibirComprovante extends StatelessWidget {
  final GlobalKey globalKey;

  const EtapaExibirComprovante({super.key, required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReemissaoComprovanteBloc, ReemissaoComprovanteState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: RepaintBoundary(
            key: globalKey,
            child: Container(
              color: const Color.fromARGB(255, 249, 249, 249),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Comprovante",
                            style: TextStyle(
                              color: InternetBankingCores.azul_500,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const Spacer(),
                          LogoBanparaClassicoHorizontal(
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(
                        state.comprovanteSelecionado!.lista.length,
                        (index) => ContainerRevisao(
                          titulo: state.comprovanteSelecionado!.lista[index].titulo,
                          lista: state.comprovanteSelecionado!.lista[index].lista,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Visibility(
                      visible: state.comprovanteSelecionado!.aviso != null,
                      child: Column(
                        children: [
                          Text(
                            state.comprovanteSelecionado!.aviso!.entries.first.key,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            state.comprovanteSelecionado!.aviso!.entries.first.value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ],
                      ),
                    ),
                    const DivisorPadrao(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Central Banpará",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "(Belém e região metropolitanta, Marabá e Santarém)",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "30044-444",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Central Banpará",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "(Demais localidades)",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "0800 285 8080",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "SAC",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "(Informações e reclamações)",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "0800 280 6605",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SAC deficiente auditivo",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "0800 280 1817",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ouvidoria",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "0800 280 9040",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
