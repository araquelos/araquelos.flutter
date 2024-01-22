part of 'autenticacao_page.dart';

class EtapaSelecionarContaSalva extends StatelessWidget {
  const EtapaSelecionarContaSalva({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          'Acessar Conta',
          style: GoogleFonts.barlow(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 8, 30, 96),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: context.read<AutenticacaoBloc>().state.listaContasSalvas!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.012,
                    horizontal: MediaQuery.of(context).size.height * 0.030,
                  ),
                  child: BotaoListaContaSalva(
                    contaSalva: context.read<AutenticacaoBloc>().state.listaContasSalvas![index],
                    aoClicar: () {
                      if (context.read<AutenticacaoBloc>().state.listaContasSalvas![index].autenticarComDigital) {
                        context.read<AutenticacaoBloc>().add(
                              AutenticacaoEventAutenticar(
                                formulario: AutenticacaoFormulario(
                                  cpf: context.read<AutenticacaoBloc>().state.listaContasSalvas![index].cpf,
                                  senha: context.read<AutenticacaoBloc>().state.listaContasSalvas![index].senha,
                                  usarDigital: context
                                      .read<AutenticacaoBloc>()
                                      .state
                                      .listaContasSalvas![index]
                                      .autenticarComDigital,
                                ),
                              ),
                            );
                      } else {
                        context.read<AutenticacaoBloc>().add(
                              AutenticacaoEventSelecionarContaSalva(
                                contaSelecionada: context.read<AutenticacaoBloc>().state.listaContasSalvas![index],
                              ),
                            );
                      }
                    },
                    aoSegurar: () {
                      AlertaServico.exibirAlerta(
                        variante: VarianteAlerta.confirmacao,
                        context: context,
                        titulo: "Excluir conta salva",
                        conteudo:
                            "Deseja excluir a conta ${UtilBrasilFields.obterCpf(context.read<AutenticacaoBloc>().state.listaContasSalvas![index].cpf)}?",
                        acoes: [
                          BotaoSecundario(
                            texto: "Cancelar",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          BotaoPrincipal(
                            texto: "Confirmar",
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<AutenticacaoBloc>().add(
                                    AutenticacaoEventExcluirContaSalva(
                                      contaSelecionada:
                                          context.read<AutenticacaoBloc>().state.listaContasSalvas![index],
                                    ),
                                  );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075,
          ),
          child: BotaoSecundario(
            texto: "Entrar com outra conta",
            onPressed: () {
              context.read<AutenticacaoBloc>().add(AutenticacaoEventEntrarNovaConta());
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        const TextNumeroVersao(
          numeroVersao: "v1.0",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}
