import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/componentes/botoes/botao_calendario.dart';
import 'package:mobile_pj/componentes/botoes/botao_selecionar.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';

class BottomSheetFiltroPeriodo extends StatefulWidget {
  final FiltroExtratoPeriodoEnum filtroPeriodo;
  final DateTime dataInicial;
  final DateTime dataFinal;

  const BottomSheetFiltroPeriodo({
    super.key,
    required this.filtroPeriodo,
    required this.dataInicial,
    required this.dataFinal,
  });

  @override
  State<BottomSheetFiltroPeriodo> createState() => _BottomSheetFiltroPeriodoState();
}

class _BottomSheetFiltroPeriodoState extends State<BottomSheetFiltroPeriodo> {
  late FiltroExtratoPeriodoEnum filtroPeriodo;
  late DateTime dataInicial;
  late DateTime dataFinal;

  @override
  void initState() {
    filtroPeriodo = widget.filtroPeriodo;
    dataInicial = widget.dataInicial;
    dataFinal = widget.dataFinal;
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
              "Selecione um período",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: InternetBankingCores.azul_500,
              ),
            ),
            const DivisorPadrao(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                BotaoSelecionar(
                  titulo: "Últimos 15 dias",
                  selecionado: filtroPeriodo == FiltroExtratoPeriodoEnum.ultimos15dias,
                  funcao: (_) => setState(() {
                    filtroPeriodo = FiltroExtratoPeriodoEnum.ultimos15dias;
                    dataInicial = DateTime.now().add(const Duration(days: -15));
                    dataFinal = DateTime.now();
                  }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                BotaoSelecionar(
                  titulo: "Últimos 30 dias",
                  selecionado: filtroPeriodo == FiltroExtratoPeriodoEnum.ultimos30dias,
                  funcao: (_) => setState(() {
                    filtroPeriodo = FiltroExtratoPeriodoEnum.ultimos30dias;
                    dataInicial = DateTime.now().add(const Duration(days: -30));
                    dataFinal = DateTime.now();
                  }),
                ),
              ],
            ),
            Row(
              children: [
                BotaoSelecionar(
                  titulo: "Últimos 60 dias",
                  selecionado: filtroPeriodo == FiltroExtratoPeriodoEnum.ultimos60dias,
                  funcao: (_) => setState(() {
                    filtroPeriodo = FiltroExtratoPeriodoEnum.ultimos60dias;
                    dataInicial = DateTime.now().add(const Duration(days: -60));
                    dataFinal = DateTime.now();
                  }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                BotaoSelecionar(
                  titulo: "Outro período",
                  selecionado: filtroPeriodo == FiltroExtratoPeriodoEnum.outroPeriodo,
                  funcao: (_) => setState(() {
                    filtroPeriodo = FiltroExtratoPeriodoEnum.outroPeriodo;
                  }),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: filtroPeriodo == FiltroExtratoPeriodoEnum.outroPeriodo ? 1 : 0,
                child: SizedBox(
                  height: filtroPeriodo == FiltroExtratoPeriodoEnum.outroPeriodo ? null : 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "De:",
                                style: TextStyle(color: InternetBankingCores.azul_500),
                              ),
                              BotaoCalendario(
                                data: dataInicial,
                                aoSelecionarData: (DateTime dataSelecionada) => setState(() {
                                  dataInicial = dataSelecionada;
                                }),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Até:",
                                style: TextStyle(color: InternetBankingCores.azul_500),
                              ),
                              BotaoCalendario(
                                data: dataFinal,
                                aoSelecionarData: (DateTime dataSelecionada) => setState(() {
                                  dataFinal = dataSelecionada;
                                }),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                        "Consulte com o limite de 60 dias dentre a data inicio e a data fim",
                        style: TextStyle(
                          color: InternetBankingCores.azul_500,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DivisorPadrao(),
            Column(
              children: [
                BotaoSecundario(
                  texto: 'Fechar',
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                BotaoPrincipal(
                  texto: 'Filtrar',
                  onPressed: () => context.read<ExtratoBloc>().add(ExtratoEventFiltrarPeriodo(
                        filtroPeriodo: filtroPeriodo,
                        dataInicial: dataInicial,
                        dataFinal: dataFinal,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
