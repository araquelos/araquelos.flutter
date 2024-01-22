import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';

class BotaoMeusContatosBase extends StatelessWidget {
  final RecebedorPix contatoSelecionado;

  const BotaoMeusContatosBase({
    super.key,
    required this.contatoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(InternetBankingRotas.pixPagarTransferirEtapa2, extra: contatoSelecionado),
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.019,
          horizontal: MediaQuery.of(context).size.height * 0.019,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              offset: const Offset(0, 3),
              blurRadius: 15.0,
              spreadRadius: 3.0,
            ),
          ],
          color: const Color.fromARGB(255, 249, 249, 249),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  contatoSelecionado.nome,
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 8, 30, 96),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AutoSizeText(
                  contatoSelecionado.chavePix,
                  style: GoogleFonts.barlow(
                    fontSize: 12,
                    color: const Color.fromARGB(80, 43, 43, 43),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            AutoSizeText(
              contatoSelecionado.tipoChavePix,
              style: GoogleFonts.barlow(
                fontSize: 12,
                color: const Color.fromARGB(80, 43, 43, 43),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
