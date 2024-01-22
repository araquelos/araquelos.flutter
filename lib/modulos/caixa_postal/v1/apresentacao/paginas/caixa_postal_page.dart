// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/apresentacao/componentes/confirmar_excluir_mensagem.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/apresentacao/componentes/detalhe_mensagem_bottomshet.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/apresentacao/componentes/excluir_mensagem_bottomshet.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/apresentacao/componentes/mensagem_caixa_postal.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';

class CaixaPostalPage extends StatefulWidget {
  const CaixaPostalPage({super.key});

  @override
  State<CaixaPostalPage> createState() => _CaixaPostalPageState();
}

class _CaixaPostalPageState extends State<CaixaPostalPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CaixaPostalBloc, CaixaPostalState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        if (state.rotaDestino != null) context.go(state.rotaDestino.toString());
      },
      child: LayoutPadrao(
        titulo: "Caixa Postal",
        subtitulo: "",
        conteudo: BlocBuilder<CaixaPostalBloc, CaixaPostalState>(builder: (context, state) {
          switch (state.etapa) {
            case CaixaPostalEtapa.exibirListaMensagens:
              return MediaQuery.removePadding(
                context: context,
                removeRight: true,
                removeLeft: true,
                child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 1,
                          color: InternetBankingCores.cinza_400,
                        ),
                    itemCount: state.listaMensagens!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(state.listaMensagens![index].id.toString()),
                        background: Container(
                          color: InternetBankingCores.vermelho_200,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: SvgPicture.asset(
                                  InternetBankingAssetsIcones.delete,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        direction: state.listaMensagensSelecionadas.isNotEmpty
                            ? DismissDirection.none
                            : DismissDirection.startToEnd,
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            ActionSheetConfirmarExcluirMensagem.openModalBottonSheet(context, index);
                          }
                          return null;
                        },
                        onDismissed: (direction) {
                          setState(() {
                            context
                                .read<CaixaPostalBloc>()
                                .add(CaixaPostalEventExcluirMensagem(idsMensagens: [state.listaMensagens![index].id]));
                          });
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: MensagemCaixaPostal(
                                titulo: state.listaMensagens![index].titulo!,
                                subTitulo: state.listaMensagens![index].descricao!,
                                tag: state.listaMensagens![index].status,
                                dataHora: state.listaMensagens![index].dataHoraEnvio,
                                mensagemSelecionada:
                                    state.listaMensagensSelecionadas.contains(state.listaMensagens![index]),
                                icone: const Icon(
                                  Icons.email,
                                ),
                              ),
                              selectedTileColor: InternetBankingCores.azul_300,
                              selected: state.listaMensagensSelecionadas.contains(state.listaMensagens![index]),
                              selectedColor: Colors.black,
                              onTap: () {
                                if (state.listaMensagensSelecionadas.isEmpty) {
                                  ActionSheetDetalharMensagem.openModalBottonSheet(
                                      context,
                                      state.listaMensagens![index].descricao!,
                                      state.listaMensagens![index].dataHoraEnvio,
                                      state.listaMensagens![index]);
                                } else {
                                  setState(() {
                                    (state.listaMensagensSelecionadas.contains(state.listaMensagens![index]))
                                        ? state.listaMensagensSelecionadas.remove(state.listaMensagens![index])
                                        : state.listaMensagensSelecionadas.add(state.listaMensagens![index]);
                                  });
                                }
                              },
                              onLongPress: () {
                                if (state.listaMensagensSelecionadas.isEmpty) {
                                  ActionSheetExcluirMensagensSelecionadas.openModalBottonSheet(
                                      context, state.listaMensagensSelecionadas.length, index);
                                }
                                setState(() {
                                  (state.listaMensagensSelecionadas.contains(state.listaMensagens![index]))
                                      ? state.listaMensagensSelecionadas.remove(state.listaMensagens![index])
                                      : state.listaMensagensSelecionadas.add(state.listaMensagens![index]);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }),
              );
            case CaixaPostalEtapa.aguardandoFimRequisicao:
              context.read<CaixaPostalBloc>().add(CaixaPostalEventIniciar());
              return const Center(
                child: CircularProgressIndicator(
                  color: InternetBankingCores.azul_500,
                ),
              );
            case null:
              context.read<CaixaPostalBloc>().add(CaixaPostalEventIniciar());
              return const Center(
                child: CircularProgressIndicator(
                  color: InternetBankingCores.azul_500,
                ),
              );
          }
        }),
        acaoVoltar: () => context.go(InternetBankingRotas.home),
      ),
    );
  }
}
