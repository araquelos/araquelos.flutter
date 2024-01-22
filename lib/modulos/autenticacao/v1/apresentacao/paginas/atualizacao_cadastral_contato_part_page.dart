part of 'atualizacao_cadastral_page.dart';

class AtualizacaoCadastralAviso extends StatelessWidget {
  const AtualizacaoCadastralAviso({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      acaoVoltar: () => context.go(InternetBankingRotas.atualizacaoCadastralMultifatorial),
      titulo: "Cadastro do Dispositivo",
      subtitulo: "Atualização Cadastral",
      conteudo: BlocBuilder<AtualizacaoCadastralBloc, AtualizacaoCadastralState>(
        builder: (context, state) {
          return Scrollbar(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Consta em nossa base cadastral as seguintes informações de contato:',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      Text.rich(
                        TextSpan(
                          text: 'Telefone: ',
                          children: <TextSpan>[
                            TextSpan(
                                text: MascaraUtils().mascararTelefone(
                                  ddd: state.dadosContato?.telefone.ddd,
                                  telefone: state.dadosContato?.telefone.numero,
                                ),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                          style: const TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      Text.rich(
                        TextSpan(
                          text: 'E-mail: ',
                          children: <TextSpan>[
                            TextSpan(
                                text: MascaraUtils().mascararEmail(email: state.dadosContato?.email),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        style: const TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      const Text(
                        'Caso seus dados estejam desatualizados clique em "ATUALIZAR CONTATOS".',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      const Text(
                        'Se corretos, prossiga clicando em "ENVIAR SMS TOKEN"',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      rodape: [
        BotaoSecundario(
          texto: "Atualizar Contatos",
          onPressed: () {
            context.read<AtualizacaoCadastralBloc>().add(EventoIrParaAtualizarContatos());
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BotaoPrincipal(
          texto: "Enviar SMS Token",
          onPressed: () {
            context.read<AtualizacaoCadastralBloc>().add(EventoEnviarSMSToken());
          },
        ),
      ],
    );
  }
}
