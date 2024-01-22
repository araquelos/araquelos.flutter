import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_base.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/valor_saldo.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';

class CardSaldo extends StatelessWidget {
  const CardSaldo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaldoBloc, SaldoState>(
      listener: (context, state) {},
      child: Container(
        decoration: const BoxDecoration(
          color: InternetBankingCores.cinza_blur,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.025,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saldo",
                      style: GoogleFonts.barlow(
                        fontSize: 14.0,
                        color: InternetBankingCores.cinza_100,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Total",
                      style: GoogleFonts.barlow(
                        fontSize: 12.0,
                        color: InternetBankingCores.cinza_100,
                      ),
                    ),
                    BlocBuilder<SaldoBloc, SaldoState>(
                      builder: (context, state) {
                        return ValorSaldo(
                          estado: state,
                          valor: state.saldoTotal,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Disponivel para saque",
                      style: GoogleFonts.barlow(
                        fontSize: 12.0,
                        color: InternetBankingCores.cinza_100,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BlocBuilder<SaldoBloc, SaldoState>(
                    builder: (context, state) => BotaoCabecalhoSvg(
                      tema: BotaoTemaEnum.transparente,
                      caminhoSvg: state.indicadorVisibilidade
                          ? InternetBankingAssetsIcones.eyeSlash
                          : InternetBankingAssetsIcones.eye,
                      tamanhoIcone: state.indicadorVisibilidade
                          ? MediaQuery.of(context).size.width * 0.075
                          : MediaQuery.of(context).size.width * 0.07,
                      funcao: () {
                        context.read<SaldoBloc>().add(SaldoEventAlternarVisibilidade());
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(InternetBankingRotas.extrato);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: const Center(
                        child: Text(
                          "Ver extrato",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: InternetBankingCores.cinza_100,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
