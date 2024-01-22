part of 'cadastrar_dispositivo_page.dart';

class EtapaAvisoOtpExpirado extends StatefulWidget {
  const EtapaAvisoOtpExpirado({super.key});

  @override
  State<EtapaAvisoOtpExpirado> createState() => _EtapaAvisoOtpExpiradoState();
}

class _EtapaAvisoOtpExpiradoState extends State<EtapaAvisoOtpExpirado> {
  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: "Cadastro BPToken",
      subtitulo: "Habilitação do dispositivo",
      conteudo: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Prezado cliente,",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text.rich(
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
              TextSpan(children: <TextSpan>[
                TextSpan(text: "Seu cartão de segurança foi desativado em "),
                TextSpan(text: "xx/xx/xxxx (DATA CARÊNCIA)", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " e não poderá ser utilizado para validar suas transações."),
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text(
              "Para continuar realizando transações financeiras complete o processo de habilitação do seu dispositivo nos terminais do Banpará. Durante esse período o seu dispositivo ficará apenas em modo consultivo.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text(
              "Dúvidas? Ligue para o SAC 0800-280-6605 ou procure sua unidade de relacionamento.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
          ],
        ),
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
