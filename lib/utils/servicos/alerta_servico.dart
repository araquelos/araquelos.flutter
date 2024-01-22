import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/utils/estado_base.dart';
import 'package:mobile_pj/utils/status_processamento.dart';

enum VarianteAlerta {
  confirmacao,
  processamento,
  informativo,
  sucesso,
  erro,
}

class AlertaServico {
  static void _exibirAlerta({
    required BuildContext context,
    required Widget? icone,
    required String titulo,
    required Widget? conteudo,
    bool permiteFechar = false,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: permiteFechar,
      showDragHandle: true,
      enableDrag: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              icone != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: icone,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: InternetBankingCores.azul_500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              conteudo ?? Container()
            ],
          ),
        );
      },
    );
  }

  static void _exibirAlertaConfirmacao({
    required BuildContext context,
    required String titulo,
    required String conteudo,
    required List<Widget> acoes,
  }) {
    _exibirAlerta(
      context: context,
      icone: null,
      titulo: titulo,
      conteudo: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            conteudo,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: InternetBankingCores.azul_500,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Column(
            children: List.generate(acoes.length, (index) => acoes[index]),
          )
        ],
      ),
      permiteFechar: true,
    );
  }

  static void _exibirAlertaCarregamento({required BuildContext context, String? titulo, String? conteudo}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.075,
            right: MediaQuery.of(context).size.width * 0.075,
            bottom: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
                child: const AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 47, 54, 142),
                    strokeWidth: 5,
                    backgroundColor: Color.fromARGB(255, 242, 244, 247),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(
                titulo ?? "Processando",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: InternetBankingCores.azul_500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(
                conteudo ?? "Aguarde alguns instantes enquanto sua transação é processada...",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: InternetBankingCores.azul_500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
            ],
          ),
        );
      },
    );
  }

  static void _exibirAlertaErro({
    required BuildContext context,
    required String titulo,
    required String conteudo,
    required Function() aoClicar,
  }) {
    _exibirAlerta(
      context: context,
      icone: null,
      titulo: titulo,
      conteudo: Column(
        children: [
          Text(
            conteudo,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: InternetBankingCores.azul_500,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          BotaoPrincipal(
            texto: "Fechar",
            onPressed: aoClicar,
          )
        ],
      ),
    );
  }

  static void _exibirAlertaSucesso({
    required BuildContext context,
    required String titulo,
    required String conteudo,
  }) {
    _exibirAlerta(
      context: context,
      icone: SvgPicture.asset(
        InternetBankingAssetsIcones.sucessoActionsheet,
      ),
      titulo: titulo,
      conteudo: Text(
        conteudo,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: InternetBankingCores.azul_500,
        ),
      ),
    );
  }

  static void _exibirAlertaInformativo({
    required BuildContext context,
    required String titulo,
    required String conteudo,
  }) {
    _exibirAlerta(
      context: context,
      icone: SvgPicture.asset(
        InternetBankingAssetsIcones.informacaoActionsheet,
      ),
      titulo: titulo,
      conteudo: Text(
        conteudo,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: InternetBankingCores.azul_500,
        ),
      ),
      permiteFechar: true,
    );
  }

  static void exibirAlerta({
    required VarianteAlerta variante,
    required BuildContext context,
    String titulo = "Titulo não informado",
    String conteudo = "Conteúdo não informado",
    List<Widget> acoes = const [],
  }) {
    switch (variante) {
      case VarianteAlerta.processamento:
        _exibirAlertaCarregamento(
          context: context,
        );
        break;
      case VarianteAlerta.informativo:
        _exibirAlertaInformativo(
          context: context,
          titulo: titulo,
          conteudo: conteudo,
        );
        break;
      case VarianteAlerta.confirmacao:
        _exibirAlertaConfirmacao(
          context: context,
          titulo: titulo,
          conteudo: conteudo,
          acoes: acoes,
        );
        break;
      case VarianteAlerta.sucesso:
        _exibirAlertaSucesso(
          context: context,
          titulo: titulo,
          conteudo: conteudo,
        );
        break;
      case VarianteAlerta.erro:
        _exibirAlertaErro(
          context: context,
          titulo: titulo,
          conteudo: conteudo,
          aoClicar: () => Navigator.of(context).pop(),
        );
        break;
    }
  }

  static void utilitario(BuildContext context, IEstadoBase state) {
    switch (state.statusProcessamento) {
      case StatusProcessamento.processando:
        AlertaServico._exibirAlertaCarregamento(context: context);
      case StatusProcessamento.processamentoConcluido:
        Navigator.of(context).pop();
        break;
      case StatusProcessamento.erro:
        AlertaServico._exibirAlertaErro(
          context: context,
          titulo: state.tituloMensagem ?? "Erro",
          conteudo: state.mensagem ?? "Erro vazio",
          aoClicar: () {
            Navigator.of(context).pop();
          },
        );
      case StatusProcessamento.sucesso:
        AlertaServico._exibirAlertaSucesso(
          context: context,
          titulo: "Sucesso",
          conteudo: state.mensagem ?? "Sucesso vazio",
        );
      default:
        null;
    }
  }
}
