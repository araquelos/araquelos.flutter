import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/botoes/botao_selecionar_multiplo.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';

class BottomSheetFiltroTransacao extends StatefulWidget {
  final List<String> listaOperacoes;
  final List<String> listaOperacoesSelecionadas;

  const BottomSheetFiltroTransacao({
    super.key,
    required this.listaOperacoes,
    required this.listaOperacoesSelecionadas,
  });

  @override
  State<BottomSheetFiltroTransacao> createState() => _BottomSheetFiltroTransacaoState();
}

class _BottomSheetFiltroTransacaoState extends State<BottomSheetFiltroTransacao> {
  List<String> listaOperacoes = [];
  List<String> listaOperacoesSelecionadas = [];

  @override
  void initState() {
    listaOperacoes.addAll(widget.listaOperacoes);
    listaOperacoesSelecionadas.addAll(widget.listaOperacoesSelecionadas);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selecione as operações",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: InternetBankingCores.azul_500,
              ),
            ),
            const DivisorPadrao(),
            Wrap(
              spacing: MediaQuery.of(context).size.width * 0.02,
              children: List.generate(
                listaOperacoes.length,
                (index) {
                  return BotaoSelecionarMultiplo(
                    texto: listaOperacoes[index],
                    selecionado: listaOperacoesSelecionadas.contains(listaOperacoes[index]),
                    aoClicar: (selecionado) => setState(() {
                      if (selecionado) {
                        listaOperacoesSelecionadas.add(listaOperacoes[index]);
                      } else {
                        listaOperacoesSelecionadas.remove(listaOperacoes[index]);
                      }
                    }),
                  );
                },
              ),
            ),
            const DivisorPadrao(),
            Column(
              children: [
                BotaoSecundario(
                  texto: 'Limpar Filtro',
                  onPressed: () => setState(() {
                    listaOperacoesSelecionadas = [];
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
                          filtroTipoTransacao: context.read<ExtratoBloc>().state.filtroTipoTransacao,
                          operacoesSelecionadas: listaOperacoesSelecionadas,
                        ));
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
