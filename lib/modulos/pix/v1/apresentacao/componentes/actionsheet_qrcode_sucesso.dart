import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';

class ActionSheetQrCodeSucesso {
  static void exibirModalDetalhar(
    BuildContext context,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 56,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(222, 222, 222, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      SvgPicture.asset(
                        InternetBankingAssetsIcones.atencaoActionsheet,
                        width: 74,
                        height: 74,
                        colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(250, 205, 46, 1),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      const Text(
                        "Sua transação foi registrada.",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal, color: InternetBankingCores.azul_500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const DivisorPadrao(),
                BotaoSecundario(
                  texto: "Voltar para a tela inicial",
                  onPressed: () => context.go(InternetBankingRotas.home),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                BotaoPrincipal(
                  texto: "Ir para Assinatura",
                  onPressed: () => context.go(InternetBankingRotas.assinatura),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
