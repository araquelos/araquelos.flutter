part of 'home_page.dart';

class AreaAssinaturas extends StatefulWidget {
  const AreaAssinaturas({super.key});

  @override
  State<AreaAssinaturas> createState() => _AreaAssinaturasState();
}

class _AreaAssinaturasState extends State<AreaAssinaturas> {
  var botoesAssinaturaSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AutoSizeText(
              "Assinaturas",
              style: GoogleFonts.barlow(
                color: InternetBankingCores.azul_500,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemAreaAssinaturas(
              caminhoSvg: InternetBankingAssetsIcones.comprovante,
              corSvg: InternetBankingCores.azul_500,
              quantidade: "192",
              rotulo: "Total de transações",
              grupo: botoesAssinaturaSizeGroup,
              aoClicar: () {
                context
                    .read<HomePageBloc>()
                    .add(EventoIrParaAssinaturas(filtro: FiltroAssinaturaTipoTransacaoEnum.todas));
              },
            ),
            ItemAreaAssinaturas(
              caminhoSvg: InternetBankingAssetsIcones.atencaoActionsheet,
              corSvg: InternetBankingCores.vermelho_500,
              quantidade: "12",
              rotulo: "Transações pendentes",
              grupo: botoesAssinaturaSizeGroup,
              aoClicar: () {
                context
                    .read<HomePageBloc>()
                    .add(EventoIrParaAssinaturas(filtro: FiltroAssinaturaTipoTransacaoEnum.pendentes));
              },
            ),
            ItemAreaAssinaturas(
              caminhoSvg: InternetBankingAssetsIcones.atencaoActionsheet,
              corSvg: InternetBankingCores.amarelo_500,
              quantidade: "3",
              rotulo: "Pendentes de assinatura",
              grupo: botoesAssinaturaSizeGroup,
              aoClicar: () {
                context
                    .read<HomePageBloc>()
                    .add(EventoIrParaAssinaturas(filtro: FiltroAssinaturaTipoTransacaoEnum.naoAssinadasPorMim));
              },
            ),
          ],
        ),
      ],
    );
  }
}
