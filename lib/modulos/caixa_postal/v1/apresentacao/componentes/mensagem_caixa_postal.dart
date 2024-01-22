import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/auxiliares/auxiliar_data.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/enum/status_mensagem_caixa_postal.dart';

class MensagemCaixaPostal extends StatelessWidget {
  final StatusMensagemCaixaPostalEnum tag;
  final Icon icone;
  final String titulo;
  final String subTitulo;
  final DateTime dataHora;
  final bool mensagemSelecionada;
  const MensagemCaixaPostal(
      {super.key,
      required this.tag,
      required this.icone,
      required this.titulo,
      required this.subTitulo,
      required this.dataHora,
      required this.mensagemSelecionada});

  @override
  Widget build(BuildContext context) {
    int numeroDiaSemana = dataHora.weekday;
    int numeroMes = dataHora.month;

    int diaDaSemana = dataHora.day;
    String nomeMes = obterNomeMes(numeroMes);
    String nomeDiaSemana = obterNomeDiaSemana(numeroDiaSemana);
    String capitalizarPrimeiraLetra(String texto) {
      if (texto.isEmpty) {
        return texto;
      }

      return texto[0].toUpperCase() + texto.substring(1);
    }

    String limitarString(String input, int tamanhoMaximo) {
      if (input.length <= tamanhoMaximo) {
        return input;
      } else {
        return '${input.substring(0, tamanhoMaximo - 3)}...';
      }
    }

    String statusMensagemFormatada = capitalizarPrimeiraLetra(tag.name);
    String descricaoFormatada = limitarString(subTitulo, 78);
    String dataFormatada = '$diaDaSemana de $nomeMes, $nomeDiaSemana.';

    return BlocBuilder<CaixaPostalBloc, CaixaPostalState>(builder: (context, state) {
      return Row(children: [
        Column(
          children: [
            mensagemSelecionada
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: InternetBankingCores.azul_500,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: InternetBankingCores.azul_200,
                    ),
                    child: Center(
                      child: titulo.contains('Crédito') || titulo.contains('Débito')
                          ? SvgPicture.asset(InternetBankingAssetsIcones.bcard)
                          : titulo.contains('Pix')
                              ? SvgPicture.asset(
                                  InternetBankingAssetsIcones.pix,
                                  colorFilter: const ColorFilter.mode(InternetBankingCores.azul_500, BlendMode.srcIn),
                                  width: 22,
                                )
                              : SvgPicture.asset(
                                  InternetBankingAssetsIcones.email,
                                  colorFilter: const ColorFilter.mode(InternetBankingCores.azul_500, BlendMode.srcIn),
                                  width: 22,
                                ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 44,
              height: 16,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: InternetBankingCores.azul_500,
              ),
              child: Center(
                child: Text(
                  statusMensagemFormatada,
                  style: GoogleFonts.barlow(fontSize: 8, color: InternetBankingCores.cinza_100),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(titulo,
                    style: GoogleFonts.barlow(fontWeight: FontWeight.bold), presetFontSizes: const [20, 18, 16]),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText(
                      descricaoFormatada,
                      style: GoogleFonts.barlow(),
                      presetFontSizes: const [13, 10],
                      overflow: TextOverflow.visible,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 95, top: 2),
                  // width: MediaQuery.of(context).size.width * 0.72,
                  child: AutoSizeText(
                    dataFormatada,
                    style: GoogleFonts.barlow(),
                    presetFontSizes: const [13, 10],
                    // overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]);
    });
  }
}
