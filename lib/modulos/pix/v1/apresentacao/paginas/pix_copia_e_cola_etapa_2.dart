import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/actionsheet_qrcode_sucesso.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/campo_valor_pix.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/info_alerta.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/switch_salvar_contato.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/formularios/campo_data_icone.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/formularios/pix_pagar_transferir_formulario.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';

class PixCopiaEColaEtapa2 extends StatefulWidget {
  final RecebedorPix recebedorPix;

  const PixCopiaEColaEtapa2({super.key, required this.recebedorPix});

  @override
  State<PixCopiaEColaEtapa2> createState() => _PixCopiaEColaEtapa2State();
}

class _PixCopiaEColaEtapa2State extends State<PixCopiaEColaEtapa2> {
  final PixPagarTransferirForm pixPagarTransferirForm = PixPagarTransferirForm();
  TextEditingController ctlValor = TextEditingController();
  TextEditingController ctlData = TextEditingController();
  TextEditingController ctlDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Pix - Copia e Cola',
      subtitulo: "",
      conteudo: Scrollbar(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color.fromRGBO(222, 222, 222, 1),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Dados do destinatário',
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.cinza_700, fontSize: 14, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Nome',
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.cinza_700, fontWeight: FontWeight.normal, fontSize: 12),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      AutoSizeText(
                        widget.recebedorPix.nome,
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.azul_500, fontWeight: FontWeight.w600, fontSize: 14),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'CPF/CNPJ',
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.cinza_700, fontWeight: FontWeight.normal, fontSize: 12),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      AutoSizeText(
                        widget.recebedorPix.cpf,
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.azul_500, fontWeight: FontWeight.w600, fontSize: 14),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Instituição',
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.cinza_700, fontWeight: FontWeight.normal, fontSize: 12),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      AutoSizeText(
                        widget.recebedorPix.instituicao,
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.azul_500, fontWeight: FontWeight.w600, fontSize: 14),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Descrição do tipo de Transação',
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.cinza_700, fontWeight: FontWeight.normal, fontSize: 12),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                      AutoSizeText(
                        widget.recebedorPix.descricaoTpTransacao,
                        style: GoogleFonts.barlow(
                            color: InternetBankingCores.azul_500, fontWeight: FontWeight.w600, fontSize: 14),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color.fromRGBO(222, 222, 222, 1),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const InfoAlerta(
                    icone: InternetBankingAssetsIcones.info,
                    info: 'Para agendar o pagamento, selecione uma data futura.',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CampoDataIcone(
                    controller: ctlData,
                    label: 'Data para Pagamento',
                    onSaved: (valor) => pixPagarTransferirForm.dataPagamento = valor,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CampoTextoFormulario(
                    controller: ctlDescricao,
                    label: 'Descrição',
                    onSaved: (valor) => pixPagarTransferirForm.descricao = valor,
                  ),
                  SwitchSalvarContato(
                    value: pixPagarTransferirForm.salvarContato,
                    onChanged: () {
                      setState(() {
                        pixPagarTransferirForm.salvarContato = !pixPagarTransferirForm.salvarContato;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Pagar R\$ ${UtilBrasilFields.obterReal(widget.recebedorPix.valor, moeda: false, decimal: 2)}",
          onPressed: () => ActionSheetQrCodeSucesso.exibirModalDetalhar(context),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
      acaoVoltar: () {
        /*RecebedorPix recebedorAtualizado = widget.recebedorPix;
        recebedorAtualizado.valor =
            ctlValor.text == "" ? widget.recebedorPix.valor : UtilBrasilFields.converterMoedaParaDouble(ctlValor.text);
        context.go(InternetBankingRotas.pixCopiaEColaEtapa1, extra: recebedorAtualizado);*/
        context.pop();
      },
    );
  }
}
