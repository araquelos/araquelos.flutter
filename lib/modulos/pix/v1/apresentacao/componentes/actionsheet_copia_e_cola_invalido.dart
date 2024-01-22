import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';

class ActionSheetCopiaEColaInvalido {
  static void exibirModalDadosInvalidos(
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
                const Text(
                  "Dados Inválidos",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: InternetBankingCores.azul_500),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  "Tente novamente. Verifique a chave inserida ou faça o Pix com os dados de Agencia e Conta.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: InternetBankingCores.azul_500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const DivisorPadrao(),
                BotaoSecundario(
                  texto: "Pagar com Agência e Conta",
                  onPressed: () => context.go(InternetBankingRotas.home),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                BotaoPrincipal(
                  texto: "Tentar Novamente",
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
