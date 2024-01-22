import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/chave_pix_validador.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/campo_chave_pix.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';
import 'package:mobile_pj/repositorios/contatos_pix_repositorio.dart';

class PixPagarTransferirEtapa1 extends StatefulWidget {
  final bool colar;

  const PixPagarTransferirEtapa1({super.key, this.colar = false});

  @override
  State<PixPagarTransferirEtapa1> createState() =>
      _PixPagarTransferirEtapa1State();
}

class _PixPagarTransferirEtapa1State extends State<PixPagarTransferirEtapa1> {
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
      titulo: 'Pix - Pagar ou transferir',
      subtitulo: "",
      conteudo: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              CampoChavePix(
                label: 'Digite a chave Pix',
                hintText: "CPF, CNPJ, Celular, E-mail",
                controller: field,
                keyboardType: TextInputType.text,
                validator: chavePixValidador,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              BotaoDestaque(
                titulo: 'Meus contatos',
                icone: InternetBankingAssetsIcones.coracao,
                funcao: () =>
                    context.pushNamed(InternetBankingRotas.pixMeusContatos),
              ),
            ],
          ),
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Continuar",
          onPressed: () {
            RecebedorPix mock = ContatosPixRepositorio.contato[3];
            mock.valor = 0;
            context.pushNamed(InternetBankingRotas.pixPagarTransferirEtapa2,
                extra: mock);
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
