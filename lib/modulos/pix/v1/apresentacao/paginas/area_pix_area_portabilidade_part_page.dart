part of 'area_pix_page.dart';

class AreaPortabilidade extends StatelessWidget {
  const AreaPortabilidade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                AutoSizeText(
                  "Portabilidade",
                  style: GoogleFonts.barlow(
                    color: InternetBankingCores.azul_500,
                    fontWeight: FontWeight.w600,
                  ),
                  presetFontSizes: const [14, 12],
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const CardPublicidade(
              visibilidade: true,
              caminhoImagem: InternetBankingAssetsImagens.imagemPortabilidade,
              corFundo: InternetBankingCores.azul_500,
              titulo: "Traga sua chave Pix para o Banpará",
              mensagem: "Registre uma nova chave ou faça uma portabilidade para o Banpará",
            ),
          ],
        ),
      ],
    );
  }
}
