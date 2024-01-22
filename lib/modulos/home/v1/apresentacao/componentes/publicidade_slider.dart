import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/componentes/card_publicidade.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/home_page_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({super.key});

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  int publicidadeAtiva = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: state.indicadorVisibilidadePublicidade
                  ? MediaQuery.of(context).size.height * 0.16
                  : MediaQuery.of(context).size.height * 0.06,
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return CardPublicidade(
                    visibilidade: state.indicadorVisibilidadePublicidade,
                    caminhoImagem: InternetBankingAssetsImagens.imagemPublicidade,
                    corFundo: const Color.fromARGB(255, 115, 15, 59),
                    titulo: "Chegou o Crédito Imobiliário Banpará",
                    mensagem: "Financiamento de até 90% do valor de avaliação do imóvel",
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      publicidadeAtiva = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            AnimatedSmoothIndicator(
              activeIndex: publicidadeAtiva,
              count: 3,
              effect: WormEffect(
                activeDotColor: const Color.fromARGB(255, 115, 15, 59),
                dotColor: const Color.fromARGB(255, 217, 217, 217),
                dotHeight: MediaQuery.of(context).size.width * 0.025,
                dotWidth: MediaQuery.of(context).size.width * 0.025,
              ),
            ),
          ],
        );
      },
    );
  }
}
