import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_icone.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/formularios/campo_cpf_formulario.dart';
import 'package:mobile_pj/componentes/formularios/campo_senha_formulario.dart';
import 'package:mobile_pj/componentes/logo_banpara_horizontal.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/acoes_tela_autenticacao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/botao_lista_conta_salva.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/fundo_tela_autenticacao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/switch_salvar_digital.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/texto_numero_versao.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/formularios/autenticacao_formulario.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/autenticacao_bloc.dart';
import 'package:mobile_pj/utils/gerenciador_interface_app.dart';

part 'autenticacao_conta_salva_part_page.dart';
part 'autenticacao_listar_contas_salvas_part_page.dart';
part 'autenticacao_nova_conta_part_page.dart';
part 'autenticacao_processando_part_page.dart';

class AutenticacaoPage extends StatefulWidget {
  const AutenticacaoPage({super.key});

  @override
  State<AutenticacaoPage> createState() => _AutenticacaoPageState();
}

class _AutenticacaoPageState extends State<AutenticacaoPage> {
  double bottomSheetHeight = 0;
  final GlobalKey _bottomSheetKey = GlobalKey();

  Widget? _etapaTelaAutenticacao;

  @override
  void initState() {
    GerenciadorInterfaceApp.alterarCorStatusBar(
      const Color.fromARGB(255, 78, 91, 125),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AutenticacaoBloc, AutenticacaoState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        if (state.rotaDestino != null) {
          GerenciadorInterfaceApp.alterarCorStatusBar(InternetBankingCores.azul_400);
          context.go(state.rotaDestino!);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: null,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              LogoBanparaHorizontal(
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const Spacer(),
              BotaoCabecalhoIcone(
                icone: Icons.menu,
                funcao: () {},
              ),
            ],
          ),
        ),
        body: BlocBuilder<AutenticacaoBloc, AutenticacaoState>(
          builder: (context, state) {
            if (state.etapa != null) {
              return Stack(
                children: [
                  const FundoTelaAutenticacao(),
                  Builder(
                    builder: (context) {
                      if (state.etapa == AutenticacaoEtapa.exibirAutenticacaoContaSalva ||
                          state.etapa == AutenticacaoEtapa.exibirListaContasSalvas) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: bottomSheetHeight + (MediaQuery.of(context).size.height * 0.01),
                            ),
                            child: const AcoesTelaAutenticacao(),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Placeholder();
            }
          },
        ),
        bottomSheet: BlocBuilder<AutenticacaoBloc, AutenticacaoState>(
          buildWhen: (_, current) => (current.etapa == AutenticacaoEtapa.exibirAutenticacaoContaSalva ||
              current.etapa == AutenticacaoEtapa.exibirListaContasSalvas ||
              current.etapa == AutenticacaoEtapa.exibirAutenticacaoNovaConta),
          builder: (context, state) {
            if (state.etapa == AutenticacaoEtapa.exibirAutenticacaoContaSalva) {
              _etapaTelaAutenticacao = EtapaEntrarContaSalva(
                autenticacaoFormulario: AutenticacaoFormulario(
                  cpf: state.ultimaContaAcessada!.cpf,
                  senha: state.ultimaContaAcessada!.senha,
                  usarDigital: state.ultimaContaAcessada!.autenticarComDigital,
                ),
              );
            } else if (state.etapa == AutenticacaoEtapa.exibirListaContasSalvas) {
              _etapaTelaAutenticacao = const EtapaSelecionarContaSalva();
            } else if (state.etapa == AutenticacaoEtapa.exibirAutenticacaoNovaConta) {
              _etapaTelaAutenticacao = const EtapaEntrarNovaConta();
            }

            afterBuild();

            return AnimatedSize(
              key: _bottomSheetKey,
              duration: const Duration(milliseconds: 300),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 900),
                child: _etapaTelaAutenticacao,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> afterBuild() async {
    await Future.delayed(Duration.zero);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (!mounted) return;

        final sheetHeight = _bottomSheetKey.currentContext?.size?.height ?? 0;
        if (sheetHeight != bottomSheetHeight) {
          setState(() {
            bottomSheetHeight = sheetHeight;
          });
        }
      },
    );
  }
}
