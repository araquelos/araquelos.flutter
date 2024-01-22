import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/container_listagem_vazia.dart';
import 'package:mobile_pj/componentes/container_revisao.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/componentes/logo_banpara_classico_horizontal.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/home/v1/widgets/apresentacao/componentes/busca.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/reemissao_comprovante_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';
import 'package:shimmer/shimmer.dart';

part 'reemissao_comprovante_exibir_lista_transacoes_part_page.dart';
part 'reemissao_comprovante_exibir_lista_comprovantes_part_page.dart';
part 'reemissao_comprovante_exibir_comprovante_part_page.dart';

class ReemissaoComprovantePage extends StatelessWidget {
  ReemissaoComprovantePage({super.key});
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReemissaoComprovanteBloc, ReemissaoComprovanteState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      builder: (context, state) {
        return LayoutPadrao(
          titulo: "Reemissão de comprovante",
          subtitulo: switch (state.etapa) {
            null => "Selecione a transação",
            EtapaReemissaoComprovante.exibirListaTransacoes => "Selecione a transação",
            EtapaReemissaoComprovante.exibirListaComprovantes => "Selecione o comprovante",
            EtapaReemissaoComprovante.exibirComprovante => "",
          },
          conteudo: switch (state.etapa) {
            null => const PlaceholderCarregamento(),
            EtapaReemissaoComprovante.exibirListaTransacoes => const EtapaExibirListaTransacoes(),
            EtapaReemissaoComprovante.exibirListaComprovantes => const EtapaExibirListaComprovantes(),
            EtapaReemissaoComprovante.exibirComprovante => EtapaExibirComprovante(globalKey: globalKey),
          },
          rodape: switch (state.etapa) {
            null => null,
            EtapaReemissaoComprovante.exibirListaTransacoes => null,
            EtapaReemissaoComprovante.exibirListaComprovantes => [
                BotaoPrincipal(
                  texto: "Realizar nova consulta",
                  onPressed: () => context.read<ReemissaoComprovanteBloc>().add(ReemissaoComprovanteEventVoltar()),
                )
              ],
            EtapaReemissaoComprovante.exibirComprovante => [
                BotaoPrincipal(
                  texto: "Compartilhar",
                  onPressed: () => context
                      .read<ReemissaoComprovanteBloc>()
                      .add(ReemissaoComprovanteEventCompartilharComprovante(globalKey: globalKey)),
                )
              ],
          },
          acaoVoltar: () => context.read<ReemissaoComprovanteBloc>().add(ReemissaoComprovanteEventVoltar()),
        );
      },
    );
  }
}
