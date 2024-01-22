part of 'area_pix_page.dart';

class AreaCanalAtendimento extends StatelessWidget {
  const AreaCanalAtendimento({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Row(
              children: [
                AutoSizeText(
                  "Canal de Atendimento",
                  style: TextStyle(
                    color: InternetBankingCores.azul_500,
                    fontWeight: FontWeight.w600,
                  ),
                  presetFontSizes: [14, 12],
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GestureDetector(
              onTap: () => context.go(InternetBankingRotas.pixCanalAtendimento),
              child: Container(
                decoration: BoxDecoration(
                  color: InternetBankingCores.azul_100,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.025,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Fale com o Banpará',
                            style: TextStyle(
                              color: InternetBankingCores.azul_500,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          const Text(
                            'Entre em contato com a nossa central de atendimento.',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: InternetBankingCores.azul_500,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Image.asset(
                            'assets/images/canal-atendimento.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ],
    );
  }
}
