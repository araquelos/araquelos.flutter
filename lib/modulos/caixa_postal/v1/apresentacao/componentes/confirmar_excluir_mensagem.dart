// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';

class ActionSheetConfirmarExcluirMensagem {
  static void openModalBottonSheet(BuildContext context, int index) {
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
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Deseja excluir esta notificação?',
                                style: GoogleFonts.barlow(
                                    fontWeight: FontWeight.w400, color: InternetBankingCores.preto_100),
                                presetFontSizes: const [14, 12],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              AutoSizeText(
                                'Obs: Ao excluir esta notificação, não será possível recuperá-la.',
                                style: GoogleFonts.barlow(
                                    fontWeight: FontWeight.w400, color: InternetBankingCores.preto_100),
                                presetFontSizes: const [12, 10],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              const DivisorPadrao(),
                              BotaoSecundario(texto: 'Cancelar', onPressed: () => Navigator.of(context).pop(true)),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              BotaoPrincipal(
                                  texto: 'Confirmar',
                                  onPressed: () => context.read<CaixaPostalBloc>().add(CaixaPostalEventExcluirMensagem(
                                      idsMensagens: [state.listaMensagens![index].id]))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }));
        });
  }
}
