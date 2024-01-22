import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoFiltro<T extends Bloc> extends StatelessWidget {
  final String titulo;
  final String icone;
  final bool filtroAtivo;
  final String? textoFiltroAtivo;
  final Widget conteudoBottomSheet;

  const BotaoFiltro({
    Key? key,
    required this.titulo,
    required this.icone,
    required this.filtroAtivo,
    required this.textoFiltroAtivo,
    required this.conteudoBottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: InternetBankingCores.azul_100,
        ),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  showDragHandle: true,
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<T>(context),
                    child: conteudoBottomSheet,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icone,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        InternetBankingCores.azul_500,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Builder(
                      builder: (context) {
                        if (!filtroAtivo) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.0025,
                            ),
                            child: Text(
                              titulo,
                              style: const TextStyle(
                                color: InternetBankingCores.azul_500,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            decoration: const BoxDecoration(
                              color: InternetBankingCores.azul_500,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.0025,
                              horizontal: MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: Text(
                              textoFiltroAtivo ?? "<Filtro não informado>",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
