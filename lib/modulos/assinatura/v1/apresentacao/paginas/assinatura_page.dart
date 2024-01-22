import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pj/componentes/botoes/botao_filtro.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/container_informativo.dart';
import 'package:mobile_pj/componentes/container_listagem_vazia.dart';
import 'package:mobile_pj/componentes/container_revisao.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/layout_scroll_saldo.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/assinatura/v1/apresentacao/componentes/bottomsheet_filtro_transacao.dart';
import 'package:mobile_pj/modulos/assinatura/v1/apresentacao/componentes/card_assinatura.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/blocs/assinatura_bloc.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';
import 'package:shimmer/shimmer.dart';

part 'assinatura_listar_operacoes_part_page.dart';

part 'assinatura_detalhar_operacao_part_page.dart';

class AssinaturaPage extends StatefulWidget {
  const AssinaturaPage({super.key});

  @override
  State<AssinaturaPage> createState() => _AssinaturaPageState();
}

class _AssinaturaPageState extends State<AssinaturaPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssinaturaBloc, AssinaturaState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      builder: (context, state) {
        return Builder(
          builder: (context) {
            switch (state.etapa) {
              case null:
              case AssinaturaEtapa.exibirListaOperacoes:
                return LayoutScrollSaldo(
                  titulo: "Assinatura",
                  scrollHabilitado:
                      state.etapa != AssinaturaEtapa.exibirListaOperacoes || (state.listaOperacoes.isEmpty)
                          ? false
                          : true,
                  condicaoExibirBuscaTexto: state.etapa == AssinaturaEtapa.exibirListaOperacoes,
                  funcaoBuscarTexto: (texto) => context.read<AssinaturaBloc>().add(
                        AssinaturaEventMudarFiltro(
                          texto: texto,
                          filtro: state.filtro!,
                        ),
                      ),
                  filtro: [
                    BotaoFiltro<AssinaturaBloc>(
                      titulo: 'Tipo de transação',
                      icone: InternetBankingAssetsIcones.moneyCheckPen,
                      filtroAtivo: state.filtro != null,
                      textoFiltroAtivo: state.filtro!.nome,
                      conteudoBottomSheet: BottomSheetFiltroTransacao(
                        valorInicial: state.filtro,
                      ),
                    ),
                  ],
                  conteudo: Builder(
                    builder: (context) {
                      switch (state.etapa) {
                        case null:
                          return const SliverFillRemaining(
                            child: PlaceholderCarregamento(),
                          );
                        case AssinaturaEtapa.exibirListaOperacoes:
                          return const EtapaListarOperacoes();
                        case AssinaturaEtapa.exibirDetalheOperacao:
                          return SliverFillRemaining(
                            child: Container(),
                          );
                      }
                    },
                  ),
                  funcaoVoltar: () => context.read<AssinaturaBloc>().add(AssinaturaEventVoltar()),
                );
              case AssinaturaEtapa.exibirDetalheOperacao:
                return const EtapaDetalharOperacao();
            }
          },
        );
      },
    );
  }
}
