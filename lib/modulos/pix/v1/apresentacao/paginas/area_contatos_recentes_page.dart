part of 'pix_pagar_transferir.dart';

class MeusContatosRecentes extends StatelessWidget {
  const MeusContatosRecentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AutoSizeText(
              "Meus contatos recentes",
              style: GoogleFonts.barlow(
                color: InternetBankingCores.azul_500,
                fontWeight: FontWeight.bold,
              ),
              presetFontSizes: const [14, 12],
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ListaTransacoes()
      ],
    );
  }
}

class ListaTransacoes extends StatelessWidget {
  const ListaTransacoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var recebedorPix = ContatosPixRepositorio.contato;
    return SingleChildScrollView(
      child: Column(children: [
        BotaoMeusContatos(
          contatoSelecionado: recebedorPix[0],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BotaoMeusContatos(
          contatoSelecionado: recebedorPix[1],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BotaoMeusContatos(
          contatoSelecionado: recebedorPix[2],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        GestureDetector(
          onTap: () => context.go(InternetBankingRotas.pixMeusContatos),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Ver todos",
              style: GoogleFonts.barlow(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 8, 30, 96),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
