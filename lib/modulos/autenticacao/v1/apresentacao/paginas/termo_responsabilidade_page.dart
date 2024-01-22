import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/termo_responsabilidade_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

class TermoResponsabilidadePage extends StatelessWidget {
  const TermoResponsabilidadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermoResponsabilidadeBloc, TermoResponsabilidadeState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      child: LayoutPadrao(
        titulo: 'Cadastro do Dispositivo',
        subtitulo: "Termo de Responsabilidade e Condições de Uso do BPToken",
        conteudo: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
            child: const Text(
              'REGULAMENTO DO SERVIÇO DE INTERNET BANKING PESSOA FÍSICA\n\nPelo presente REGULAMENTO, o BANCO DO ESTADO DO PARÁ S.A. institui as normas e condições de uso do serviço INTERNET BANKING PESSOA FÍSICA para clientes Pessoa Física, objetivando balizar a prestação deste serviço.\n\nPara efeito deste Regulamento, são adotados os seguintes conceitos:\n\na) CLIENTE: Pessoa Física, Titular da conta, identificada por seu CPF ou Procurador por esta autorizada, que formaliza solicitação para ativação do serviço Internet Banking Pessoa Física para acesso e movimentação de Conta Corrente ou Poupança.\n\nb) INTERNET BANKING: Canal de autoatendimento acessado via Internet, onde são disponibilizados serviços de consultas e realização de transações financeiras para clientes do Banpará.\n\nc) MOBILE BANKING: Canal de acesso a conta por meio de aplicativo disponibilizado para dispositivos móveis (smartphones e tablets).\n\n',
              textAlign: TextAlign.justify,
              style: TextStyle(letterSpacing: -0.1),
            ),
          ),
        ),
        rodape: [
          BotaoSecundario(
            texto: "Recusar",
            onPressed: () {
              context.read<TermoResponsabilidadeBloc>().add(TermoResponsabilidadeEventRecusaTermo());
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          BotaoPrincipal(
            texto: "Aceitar",
            onPressed: () {
              context.read<TermoResponsabilidadeBloc>().add(TermoResponsabilidadeEventAceiteTermo());
            },
          ),
        ],
        acaoVoltar: () => context.read<TermoResponsabilidadeBloc>().add(TermoResponsabilidadeEventRecusaTermo()),
      ),
    );
  }
}
