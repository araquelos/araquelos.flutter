import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/campo_valor_pix.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/info_alerta.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';

class PixPagarTransferirEtapa2 extends StatefulWidget {
  final RecebedorPix recebedorPix;

  const PixPagarTransferirEtapa2({super.key, required this.recebedorPix});

  @override
  State<PixPagarTransferirEtapa2> createState() => _PixPagarTransferirEtapa2State();
}

class _PixPagarTransferirEtapa2State extends State<PixPagarTransferirEtapa2> {
  TextEditingController ctlValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Pix - Pagar ou transferir',
      subtitulo: "",
      conteudo: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CampoValorPix(
              controller: ctlValor,
              label: 'Valor do Pix',
              hintText: UtilBrasilFields.obterReal(widget.recebedorPix.valor, moeda: true, decimal: 2),
              valorPadrao: UtilBrasilFields.obterReal(widget.recebedorPix.valor, moeda: true, decimal: 2),
              keyboardType: TextInputType.number,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true, casasDecimais: 2),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              style: GoogleFonts.barlow(color: InternetBankingCores.cinza_700, fontSize: 12),
              TextSpan(
                text: 'Transferência para\n',
                children: <TextSpan>[
                  TextSpan(
                    text: widget.recebedorPix.nome,
                    style: GoogleFonts.barlow(
                        color: InternetBankingCores.azul_500, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      alerta: const [
        InfoAlerta(
          icone: InternetBankingAssetsIcones.info,
          info: 'Confira os dados do recebedor. Tenha cuidado com golpes.',
        ),
      ],
      rodape: [
        BotaoPrincipal(
          texto: "Continuar",
          onPressed: () {
            RecebedorPix recebedorAtualizado = widget.recebedorPix;
            recebedorAtualizado.valor = UtilBrasilFields.converterMoedaParaDouble(ctlValor.text);
            context.pushNamed(InternetBankingRotas.pixPagarTransferirEtapa3, extra: recebedorAtualizado);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
      acaoVoltar: () => context.pop(),
    );
  }
}
