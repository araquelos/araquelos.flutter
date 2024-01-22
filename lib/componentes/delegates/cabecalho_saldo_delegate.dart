import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_pj/componentes/botoes/botao_cabecalho_icone.dart';
import 'package:mobile_pj/componentes/logo_banpara_horizontal.dart';
import 'package:mobile_pj/componentes/card_saldo_layout_scrollavel.dart';

class CabecalhoSaldoDelegate implements SliverPersistentHeaderDelegate {
  final String titulo;
  final double tamanhoMinimo;
  final double tamanhoMaximo;
  final Function() funcaoVoltar;

  CabecalhoSaldoDelegate({
    required this.titulo,
    required this.tamanhoMinimo,
    required this.tamanhoMaximo,
    required this.funcaoVoltar,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var offset = calcularOffset(shrinkOffset);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 31, 96),
                Color.fromARGB(255, 116, 14, 58),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.075,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Row(
            children: [
              BotaoCabecalhoIcone(
                icone: Icons.arrow_back,
                funcao: funcaoVoltar,
              ),
              const Spacer(),
              LogoBanparaHorizontal(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.03,
          margin: EdgeInsets.lerp(
            EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.35,
              top: MediaQuery.of(context).size.height * 0.0175,
            ),
            EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.085,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            offset,
          )!,
          child: Row(
            children: [
              Text(
                titulo,
                style: TextStyle.lerp(
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  offset,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          margin: EdgeInsets.lerp(
            EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.095,
            ),
            EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.135,
            ),
            offset,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: offset,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06,
              ),
              child: const CardSaldoLayoutScrollavel(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
            offset: const Offset(0, 1.25),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.03,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => tamanhoMaximo;

  @override
  double get minExtent => tamanhoMinimo;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;

  double calcularOffset(double shrinkOffset) {
    double offset = 1.0 - (max(0.0, shrinkOffset * 2.5) / maxExtent);
    return offset < 0 ? 0 : offset;
  }
}
