// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/mensagem_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/auxiliares/auxiliar_data.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';

class ActionSheetDetalharMensagem {
  static void openModalBottonSheet(
      BuildContext context, String descricao, DateTime data, MensagemDTO mensagemSelecionada) {
    int numeroDiaSemana = data.weekday;
    int numeroMes = data.month;

    int diaDaSemana = data.day;
    String nomeMes = obterNomeMes(numeroMes);
    String nomeDiaSemana = obterNomeDiaSemana(numeroDiaSemana);
    String dataFormatada = '$diaDaSemana de $nomeMes, $nomeDiaSemana.';
    showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<CaixaPostalBloc>(context),
          child: BlocBuilder<CaixaPostalBloc, CaixaPostalState>(builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: const BoxDecoration(),
                        child: const Row(
                          children: [],
                        )),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            dataFormatada,
                            style: GoogleFonts.barlow(color: InternetBankingCores.preto_100),
                            presetFontSizes: const [13, 10],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          AutoSizeText(
                            descricao,
                            style: GoogleFonts.barlow(color: InternetBankingCores.preto_100),
                            presetFontSizes: const [13, 10],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const DivisorPadrao(),
                          BotaoPrincipal(texto: 'Extrato', onPressed: () => context.go(InternetBankingRotas.extrato)),
                          BotaoPrincipal(texto: 'Fechar', onPressed: () => Navigator.of(context).pop(false)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    ).then((value) {
      context
          .read<CaixaPostalBloc>()
          .add(CaixaPostalEventMarcarMensagemComoLida(mensagemSelecionada: mensagemSelecionada));
    });
  }
}
