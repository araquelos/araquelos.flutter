part of 'pix_pagar_transferir.dart';

class AreaOutrosPagamentos extends StatefulWidget {
  const AreaOutrosPagamentos({super.key});

  @override
  State<AreaOutrosPagamentos> createState() => _AreaOutrosPagamentosState();
}

class _AreaOutrosPagamentosState extends State<AreaOutrosPagamentos> {
  AutoSizeGroup grupoMaisOpcoesPix = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AutoSizeText(
              "Outros pagamentos",
              style: GoogleFonts.barlow(
                color: InternetBankingCores.azul_500,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.qrcode,
              tamanhoIcone: MediaQuery.of(context).size.width * 0.08,
              funcao: () =>
                  context.pushNamed(InternetBankingRotas.pixLerQrCode),
              grupo: grupoMaisOpcoesPix,
              rotulo: "Ler\nQR Code",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.copyPaste,
              tamanhoIcone: 30,
              funcao: () =>
                  context.pushNamed(InternetBankingRotas.pixCopiaECola),
              grupo: grupoMaisOpcoesPix,
              rotulo: "Copia\ne Cola",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.cartao,
              tamanhoIcone: 30,
              funcao: () {},
              grupo: grupoMaisOpcoesPix,
              rotulo: "Agência\ne Conta",
            ),
          ],
        ),
      ],
    );
  }
}
