import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/container_revisao.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/componentes/logo_banpara_classico_horizontal.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/comprovante_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

class ComprovantePage extends StatelessWidget {
  ComprovantePage({super.key});

  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComprovanteBloc, ComprovanteState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      builder: (context, state) {
        return LayoutPadrao(
          titulo: "Comprovante",
          subtitulo: "",
          conteudo: switch (state.etapa) {
            null => const PlaceholderCarregamento(),
            EtapaComprovante.etapaExibirComprovante => SingleChildScrollView(
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
                              state.comprovante!.lista.length,
                              (index) => ContainerRevisao(
                                titulo: state.comprovante!.lista[index].titulo,
                                lista: state.comprovante!.lista[index].lista,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Visibility(
                            visible: state.comprovante!.aviso != null,
                            child: Column(
                              children: [
                                Text(
                                  state.comprovante!.aviso!.entries.first.key,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.015,
                                ),
                                Text(
                                  state.comprovante!.aviso!.entries.first.value,
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
                                    "3004-4444",
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
              ),
          },
          rodape: switch (state.etapa) {
            null => null,
            EtapaComprovante.etapaExibirComprovante => [
                BotaoPrincipal(
                  texto: "Compartilhar",
                  onPressed: () =>
                      context.read<ComprovanteBloc>().add(ComprovanteEventCompartilhar(globalKey: globalKey)),
                )
              ],
          },
          acaoVoltar: () => context.read<ComprovanteBloc>().add(ComprovanteEventVoltar()),
        );
      },
    );
  }
}
