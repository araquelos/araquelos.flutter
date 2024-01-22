import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/botao_lista_conta.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_conta_bloc.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

class SelecionarContaPage extends StatelessWidget {
  const SelecionarContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelecionarContaBloc, SelecionarContaState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      child: LayoutPadrao(
        titulo: "Conta",
        subtitulo: "Selecionar Conta",
        conteudo: BlocBuilder<SelecionarContaBloc, SelecionarContaState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.075,
              ),
              child: Scrollbar(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    itemCount: state.contas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BotaoListaConta(
                        conta: state.contas[index],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        acaoVoltar: () {
          context.read<SelecionarContaBloc>().add(SelecionarContaEventLogoff());
        },
      ),
    );
  }
}
