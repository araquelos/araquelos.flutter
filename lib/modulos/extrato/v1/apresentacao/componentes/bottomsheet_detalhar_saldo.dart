import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';

class BottomSheetDetalharSaldo extends StatelessWidget {
  const BottomSheetDetalharSaldo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaldoBloc, SaldoState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Saldo em conta corrente",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: InternetBankingCores.azul_500,
                  ),
                ),
                const DivisorPadrao(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        InternetBankingAssetsIcones.circleDollar,
                        width: MediaQuery.of(context).size.width * 0.2,
                        colorFilter: const ColorFilter.mode(
                          InternetBankingCores.azul_500,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        UtilBrasilFields.obterReal(state.saldoContaCorrente!.saldo),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: InternetBankingCores.azul_500,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      const Text(
                        "Veja abaixo as informações do seu saldo",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 43, 43, 43),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Valor utilizado",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.limiteUtilizado),
                  valorNegativo: false,
                  zebrado: true,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Tarifa Pendente de Cobrança",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.tarifaPendenteCobranca),
                  valorNegativo: true,
                  zebrado: false,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Bloqueio por parcela em atraso",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.bloqueioParcelaCreditoAtraso),
                  valorNegativo: true,
                  zebrado: true,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Saldo da conta de investimento",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.saldoDisponivelContaInvestimento),
                  valorNegativo: false,
                  zebrado: false,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Saldo para saque",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.saldoDisponivelSaque),
                  valorNegativo: false,
                  zebrado: true,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Saldo bloqueado",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.saldoBloqueado),
                  valorNegativo: false,
                  zebrado: false,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Saldo total",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.saldoTotal),
                  valorNegativo: false,
                  zebrado: true,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Banpará Taxa",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.taxaJuros),
                  valorNegativo: false,
                  zebrado: false,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Juros",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.juros),
                  valorNegativo: false,
                  zebrado: true,
                ),
                ItemDetalhamentoSaldo(
                  chave: "IOF",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.iof),
                  valorNegativo: false,
                  zebrado: false,
                ),
                ItemDetalhamentoSaldo(
                  chave: "Limite",
                  valor: UtilBrasilFields.obterReal(state.saldoContaCorrente!.limite),
                  valorNegativo: false,
                  zebrado: true,
                ),
                Builder(
                  builder: (context) {
                    if (state.saldoContaCorrente!.descricaoLimite.isNotEmpty) {
                      return ItemDetalhamentoSaldo(
                        chave: "Descrição",
                        valor: state.saldoContaCorrente!.descricaoLimite,
                        valorNegativo: false,
                        zebrado: false,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                BotaoPrincipal(
                  texto: 'Fechar',
                  onPressed: () {
                    context.read<SaldoBloc>().add(SaldoEventFecharDetalhamentoSaldo());
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ItemDetalhamentoSaldo extends StatelessWidget {
  final String chave;
  final String valor;
  final bool valorNegativo;
  final bool zebrado;

  const ItemDetalhamentoSaldo({
    super.key,
    required this.chave,
    required this.valor,
    required this.valorNegativo,
    required this.zebrado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
        color: zebrado ? const Color.fromARGB(255, 238, 238, 238) : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            chave,
            style: GoogleFonts.barlow(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: valorNegativo ? const Color.fromARGB(255, 234, 28, 36) : InternetBankingCores.azul_500,
            ),
          ),
          AutoSizeText(
            valor,
            style: GoogleFonts.barlow(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: InternetBankingCores.azul_500,
            ),
          ),
        ],
      ),
    );
  }
}
