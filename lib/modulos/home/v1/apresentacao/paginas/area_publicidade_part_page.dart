part of 'home_page.dart';

class AreaPublicidade extends StatefulWidget {
  const AreaPublicidade({
    super.key,
  });

  @override
  State<AreaPublicidade> createState() => _AreaPublicidadeState();
}

class _AreaPublicidadeState extends State<AreaPublicidade> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Row(
                children: [
                  AutoSizeText(
                    "Para você",
                    style: GoogleFonts.barlow(
                      color: InternetBankingCores.azul_500,
                      fontWeight: FontWeight.w600,
                    ),
                    presetFontSizes: const [14, 12],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<HomePageBloc>().add(EventoAlternarVisibilidadePublicidade());
                    },
                    child: Row(
                      children: [
                        AutoSizeText(
                          state.indicadorVisibilidadePublicidade ? "Exibir menos" : "Exibir mais",
                          style: GoogleFonts.barlow(
                            color: InternetBankingCores.azul_500,
                            fontWeight: FontWeight.bold,
                          ),
                          presetFontSizes: const [14, 12],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        SvgPicture.asset(
                          state.indicadorVisibilidadePublicidade
                              ? InternetBankingAssetsIcones.setaUpPublicidade
                              : InternetBankingAssetsIcones.setaDownPublicidade,
                          width: MediaQuery.of(context).size.width * 0.025,
                          colorFilter: const ColorFilter.mode(
                            InternetBankingCores.vermelho_500,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const SliderCarousel(),
          ],
        );
      },
    );
  }
}
