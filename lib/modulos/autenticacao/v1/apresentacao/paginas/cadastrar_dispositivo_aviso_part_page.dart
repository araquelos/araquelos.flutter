part of 'cadastrar_dispositivo_page.dart';

class EtapaAviso extends StatelessWidget {
  const EtapaAviso({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Cadastro do Dispositivo',
      subtitulo: "Aviso",
      conteudo: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Realize transações financeiras com maior segurança e comodidade por meio do seu dispositivo celular.',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text.rich(
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
              TextSpan(
                text: 'Cadastre e habilite o seu ',
                children: <TextSpan>[
                  TextSpan(text: 'BPToken', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' em apenas 2 passos:'),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '1. Atualize ou confirme o apelido do seu dispositivo e número de contato',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                ),
                Text(
                  '2. Habilite seu aparelho nos caixas eletrônicos do Banpará',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text(
              'No caso de dúvidas, contate o SAC 0800 280 6605',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
          ],
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Continuar",
          onPressed: () {
            context.read<CadastrarDispositivoBloc>().add(EventoIrParaNomearDispositivo());
          },
        ),
      ],
      acaoVoltar: () {
        context.read<CadastrarDispositivoBloc>().add(EventoLogoff());
      },
    );
  }
}
