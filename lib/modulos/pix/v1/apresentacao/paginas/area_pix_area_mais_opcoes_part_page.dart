part of 'area_pix_page.dart';

class AreaMaisOpcoes extends StatelessWidget {
  AreaMaisOpcoes({super.key});

  AutoSizeGroup grupoMaisOpcoesPix = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AutoSizeText(
              "Mais opções",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.extrato,
              tamanhoIcone: MediaQuery.of(context).size.width * 0.06,
              funcao: () {},
              //funcao: () => context.pushNamed(InternetBankingRotas.pixExtratoDevolucoes),
              grupo: grupoMaisOpcoesPix,
              rotulo: "Extrato e Devoluções",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.chave,
              tamanhoIcone: 30,
              funcao: () {},
              //funcao: () => context.pushNamed(InternetBankingRotas.pixMinhasChaves),
              grupo: grupoMaisOpcoesPix,
              rotulo: "Minhas Chaves",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            BotaoMenu(
              tema: BotaoTemaEnum.solido,
              caminhoSvg: InternetBankingAssetsIcones.coracao,
              tamanhoIcone: 30,
              funcao: () {},
              //funcao: () => context.pushNamed(InternetBankingRotas.pixMeusContatos),
              grupo: grupoMaisOpcoesPix,
              rotulo: "Meus Contatos",
            ),
          ],
        ),
      ],
    );
  }
}
