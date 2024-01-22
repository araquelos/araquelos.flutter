part of 'area_pix_page.dart';

class AreaBotoesDestaque extends StatelessWidget {
  const AreaBotoesDestaque({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BotaoDestaque(
          titulo: 'Pagar ou Transferir',
          icone: InternetBankingAssetsIcones.saldo,
          funcao: () => context.pushNamed(InternetBankingRotas.pixPagarTransferir),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        BotaoDestaque(
          titulo: 'Receber',
          icone: InternetBankingAssetsIcones.qrcode,
          funcao: () => context.pushNamed(InternetBankingRotas.pixReceber),
        ),
      ],
    );
  }
}
