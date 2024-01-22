part of 'home_page.dart';

class AreaCabecalho extends StatelessWidget {
  const AreaCabecalho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      child: Ink(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 31, 96),
              Color.fromARGB(255, 116, 14, 58),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                LogoBanparaHorizontal(
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                const Spacer(),
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    return BotaoCabecalhoSvg(
                      tema: BotaoTemaEnum.transparente,
                      caminhoSvg: InternetBankingAssetsIcones.sino,
                      funcao: () => context.go(InternetBankingRotas.caixaPostal),
                      tag: state.indicadorPossuiMensagensNaoLidas
                          ? Container(
                              height: MediaQuery.of(context).size.width * 0.04,
                              width: MediaQuery.of(context).size.width * 0.04,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  state.quantidadeMensagensNaoLidas.toString(),
                                  style: GoogleFonts.barlow(
                                    color: InternetBankingCores.azul_500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  presetFontSizes: const [10, 8, 6],
                                ),
                              ),
                            )
                          : Container(),
                      tagPisca: true,
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                BotaoCabecalhoSvg(
                  tema: BotaoTemaEnum.transparente,
                  caminhoSvg: InternetBankingAssetsIcones.usuario,
                  funcao: () {},
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  "Olá, ",
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  fabrica<GerenciadorUsuario>().usuario!.nome.split(" ")[0],
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const CardSaldo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            MenuRapido(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
