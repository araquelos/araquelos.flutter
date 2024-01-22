import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pj/componentes/container_informativo.dart';
import 'package:mobile_pj/componentes/container_listagem_vazia.dart';
import 'package:mobile_pj/componentes/layouts/layout_scroll_saldo.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/bottomsheet_filtro_transacao.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/bottomsheet_filtro_periodo.dart';
import 'package:mobile_pj/componentes/botoes/botao_filtro.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/bottomsheet_filtro_operacao.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/extrato_movimento_diario.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/rodape_extrato_titulo.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/componentes/rodape_extrato_valor.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';

part 'extrato_exibir_lancamentos_part_page.dart';

class ExtratoPage extends StatelessWidget {
  const ExtratoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExtratoBloc, ExtratoState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
      },
      child: BlocBuilder<ExtratoBloc, ExtratoState>(
        builder: (context, state) {
          return LayoutScrollSaldo(
            titulo: "Extrato",
            scrollHabilitado:
                state.etapa != ExtratoEtapa.exibirLancamentos || (state.movimentos.isEmpty && !state.filtroTextoAtivo)
                    ? false
                    : true,
            funcaoBuscarTexto: (String texto) => context.read<ExtratoBloc>().add(ExtratoEventFiltrar(
                  textoFiltro: texto,
                  filtroTipoTransacao: state.filtroTipoTransacao,
                  operacoesSelecionadas: state.listaOperacoesSelecionadas,
                )),
            filtro: [
              BotaoFiltro<ExtratoBloc>(
                titulo: "Selecione um período",
                icone: InternetBankingAssetsIcones.calendario,
                filtroAtivo: state.filtroPeriodoAtivo,
                textoFiltroAtivo:
                    "${DateFormat("dd/MM/yyyy").format(state.dataInicial)} - ${DateFormat("dd/MM/yyyy").format(state.dataFinal)}",
                conteudoBottomSheet: BottomSheetFiltroPeriodo(
                  filtroPeriodo: state.filtroPeriodo,
                  dataInicial: state.dataInicial,
                  dataFinal: state.dataFinal,
                ),
              ),
              BotaoFiltro<ExtratoBloc>(
                titulo: 'Operação',
                icone: InternetBankingAssetsIcones.arrowUpArrowDown,
                filtroAtivo: state.filtroTipoTransacaoAtivo,
                textoFiltroAtivo: state.filtroTipoTransacao?.nome,
                conteudoBottomSheet: BottomSheetFiltroOperacao(
                  valorInicial: state.filtroTipoTransacao,
                ),
              ),
              Visibility(
                visible: state.listaOperacoes.isNotEmpty,
                child: BotaoFiltro<ExtratoBloc>(
                  titulo: 'Transação',
                  icone: InternetBankingAssetsIcones.moneyCheckPen,
                  filtroAtivo: state.listaOperacoesSelecionadas.isNotEmpty,
                  textoFiltroAtivo:
                      "${state.listaOperacoesSelecionadas.firstOrNull ?? ""}${state.listaOperacoesSelecionadas.length > 1 ? ", +${state.listaOperacoesSelecionadas.length - 1}" : ""}",
                  conteudoBottomSheet: BottomSheetFiltroTransacao(
                    listaOperacoes: state.listaOperacoes,
                    listaOperacoesSelecionadas: state.listaOperacoesSelecionadas,
                  ),
                ),
              ),
            ],
            condicaoExibirFiltro: !state.filtroTextoAtivo,
            funcaoLimparFiltro: () => context.read<ExtratoBloc>().add(ExtratoEventLimparFiltros()),
            condicaoExibirLimparFiltro: state.filtroPeriodoAtivo ||
                state.filtroTipoTransacaoAtivo ||
                state.listaOperacoesSelecionadas.isNotEmpty,
            conteudo: Builder(
              builder: (context) {
                switch (state.etapa) {
                  case null:
                    return const SliverFillRemaining(
                      child: PlaceholderCarregamento(),
                    );
                  case ExtratoEtapa.exibirLancamentos:
                    return const EtapaExibirTransacoes();
                }
              },
            ),
            //inicializacaoConcluida: state.etapa != null,
            funcaoVoltar: () => context.pop(),
          );
        },
      ),
    );
  }
}
