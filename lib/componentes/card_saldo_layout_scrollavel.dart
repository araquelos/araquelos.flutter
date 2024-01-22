import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/bottomsheet_detalhar_saldo.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/valor_saldo.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';

class CardSaldoLayoutScrollavel extends StatelessWidget {
  const CardSaldoLayoutScrollavel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaldoBloc, SaldoState>(
      listener: (context, state) {
        switch (state.etapa) {
          case null:
            break;
          case SaldoEtapa.detalharSaldoContaCorrente:
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<SaldoBloc>(context),
                child: const BottomSheetDetalharSaldo(),
              ),
            );
          case SaldoEtapa.detalharSaldoContaPoupanca:
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<SaldoBloc>(context),
                child: Container(),
              ),
            );
        }
      },
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: InternetBankingCores.cinza_blur,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                  top: MediaQuery.of(context).size.width * 0.02,
                  bottom: MediaQuery.of(context).size.width * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Saldo disponível",
                          style: TextStyle(
                            fontSize: 14,
                            color: InternetBankingCores.cinza_100,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        BlocBuilder<SaldoBloc, SaldoState>(
                          builder: (context, state) {
                            return ValorSaldo(
                              estado: state,
                              valor: state.saldoDisponivelSaque,
                            );
                          },
                        ),
                      ],
                    ),
                    BlocBuilder<SaldoBloc, SaldoState>(
                      builder: (context, state) => BotaoCabecalhoSvg(
                        tema: BotaoTemaEnum.transparente,
                        caminhoSvg: state.indicadorVisibilidade
                            ? InternetBankingAssetsIcones.eyeSlash
                            : InternetBankingAssetsIcones.eye,
                        tamanhoIcone: state.indicadorVisibilidade
                            ? MediaQuery.of(context).size.width * 0.075
                            : MediaQuery.of(context).size.width * 0.07,
                        tamanhoBotao: MediaQuery.of(context).size.width * 0.1,
                        funcao: () {
                          context.read<SaldoBloc>().add(SaldoEventAlternarVisibilidade());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Container(
                  height: 1,
                  color: InternetBankingCores.cinza_blur,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.01,
                ),
                child: GestureDetector(
                  onTap: () => context.read<SaldoBloc>().add(SaldoEventDetalharSaldo()),
                  behavior: HitTestBehavior.opaque,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Detalhar",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: InternetBankingCores.cinza_100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
