part of 'cadastrar_dispositivo_page.dart';

class EtapaAvisoNovaHabilitacao extends StatefulWidget {
  const EtapaAvisoNovaHabilitacao({super.key});

  @override
  State<EtapaAvisoNovaHabilitacao> createState() => _EtapaAvisoNovaHabilitacaoState();
}

class _EtapaAvisoNovaHabilitacaoState extends State<EtapaAvisoNovaHabilitacao> {
  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: "Cadastro BPToken",
      subtitulo: "Aviso",
      conteudo: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Você já possui um dispositivo habilitado. Se quiser que este seja o seu novo dispositivo gerador de token é necessário realizar o processo de troca de dispositivos.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color.fromARGB(255, 8, 30, 96),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          const Text.rich(
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color.fromARGB(255, 8, 30, 96),
            ),
            TextSpan(children: <TextSpan>[
              TextSpan(
                  text:
                      "Para efetuar a troca do dispositivo, dirija-se a um Caixa Eletrônico Banpará e, primeiramente, "),
              TextSpan(text: "desabilite", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      " o dispositivo a ser substituído através da opção: Outros Serviços >> Segurança e Acesso >> BPToken >> Desabilitar Dispositivo. Após, habilite o dispositivo desejado, escolhendo pelo apelido que você atribuiu, através da opção: Outros Serviços >> Segurança e Acesso >> BPToken >> Habilitar Dispositivo."),
            ]),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          const Text(
            "Até que você realize os procedimentos acima, este dispositivo somente poderá ser utilizado em modo consultivo.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color.fromARGB(255, 8, 30, 96),
            ),
          ),
        ],
      ),
      rodape: [
        BotaoSecundario(
          texto: "Guia de Habilitação",
          onPressed: () => context.read<CadastrarDispositivoBloc>().add(EventoIrParaGuiaHabilitacao()),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BotaoPrincipal(
          texto: "Ciente e de acordo",
          onPressed: () => context.read<CadastrarDispositivoBloc>().add(EventoFinalizar()),
        )
      ],
      acaoVoltar: () => context.read<CadastrarDispositivoBloc>().add(EventoLogoff()),
    );
  }
}
