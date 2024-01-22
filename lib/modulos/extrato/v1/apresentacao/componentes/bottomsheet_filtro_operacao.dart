import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/componentes/botoes/botao_selecionar.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';

class BottomSheetFiltroOperacao extends StatefulWidget {
  final FiltroExtratoTipoTransacaoEnum? valorInicial;

  const BottomSheetFiltroOperacao({
    super.key,
    required this.valorInicial,
  });

  @override
  State<BottomSheetFiltroOperacao> createState() => _BottomSheetFiltroOperacaoState();
}

class _BottomSheetFiltroOperacaoState extends State<BottomSheetFiltroOperacao> {
  FiltroExtratoTipoTransacaoEnum? valorAtual;

  @override
  void initState() {
    valorAtual = widget.valorInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selecione o tipo de transação",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: InternetBankingCores.azul_500,
              ),
            ),
            const DivisorPadrao(),
            Row(
              children: [
                BotaoSelecionar(
                  titulo: "Entrada",
                  selecionado: valorAtual == FiltroExtratoTipoTransacaoEnum.entradas,
                  funcao: (_) => setState(() {
                    valorAtual = FiltroExtratoTipoTransacaoEnum.entradas;
                  }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                BotaoSelecionar(
                  titulo: "Saída",
                  selecionado: valorAtual == FiltroExtratoTipoTransacaoEnum.saidas,
                  funcao: (_) => setState(() {
                    valorAtual = FiltroExtratoTipoTransacaoEnum.saidas;
                  }),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const DivisorPadrao(),
            Column(
              children: [
                BotaoSecundario(
                  texto: 'Limpar Filtro',
                  onPressed: () => setState(() {
                    valorAtual = null;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                BotaoPrincipal(
                  texto: 'Filtrar',
                  onPressed: () {
                    context.read<ExtratoBloc>().add(ExtratoEventFiltrar(
                          textoFiltro: "",
                          filtroTipoTransacao: valorAtual,
                          operacoesSelecionadas: context.read<ExtratoBloc>().state.listaOperacoesSelecionadas,
                        ));
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
