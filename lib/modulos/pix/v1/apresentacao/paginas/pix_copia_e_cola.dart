import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/actionsheet_copia_e_cola_invalido.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/campo_chave_pix.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/info_alerta.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';
import 'package:mobile_pj/repositorios/contatos_pix_repositorio.dart';

class PixCopiaECola extends StatefulWidget {
  final bool colar;

  const PixCopiaECola({super.key, this.colar = false});

  @override
  State<PixCopiaECola> createState() => _PixCopiaEColaState();
}

class _PixCopiaEColaState extends State<PixCopiaECola> {
  TextEditingController field = TextEditingController();
  String pasteValue = '';

  @override
  Widget build(BuildContext context) {
    if (widget.colar == true) {
      FlutterClipboard.paste().then((value) {
        setState(() {
          field.text = value;
          pasteValue = value;
        });
      });
    }
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
                children: [
                  CampoChavePix(
                    label: 'Digite ou cole QR Code para Realizar o Pix',
                    hintText: "Inserir Código QR",
                    keyboardType: TextInputType.text,
                    controller: field,
                    textLength: 12,
                    onTapCampo: () {},
                    onTapColarChave: () => context.pushNamed(InternetBankingRotas.pixCopiaECola, extra: true),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const InfoAlerta(
                    icone: InternetBankingAssetsIcones.info,
                    info: 'Confira os dados do recebedor. Tenha cuidado com golpes.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Continuar",
          onPressed: () {
            if (true) {
              RecebedorPix dadosContatoQrCode = ContatosPixRepositorio.contato[3];
              context.pushNamed(InternetBankingRotas.pixCopiaEColaEtapa1, extra: dadosContatoQrCode);
            } else {
              ActionSheetCopiaEColaInvalido.exibirModalDadosInvalidos(context);
            }
          },
        ),
      ],
      acaoVoltar: () => context.pop(),
    );
  }
}
