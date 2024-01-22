import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';

class GerenciadorUsuario {
  AutenticarRespostaDTO? usuario;
  bool erroMultifatorial = false;

  void registrarLogin(AutenticarRespostaDTO autenticarResposta) {
    usuario = autenticarResposta;
  }

  void registrarAceiteTermoResponsabilidade() {
    usuario = usuario!.copyWith(indicadorTermoResponsabilidade: true);
  }

  void registrarAtualizacaoCadastral() {
    usuario = usuario!.copyWith(indicadorAtualizacaoCadastral: false);
  }

  void registrarDispositivoRenomeado() {
    usuario = usuario!.copyWith(dispositivo: usuario!.dispositivo.copyWith(indicadorNovo: false));
  }

  void registrarErroMultifatorial() {
    erroMultifatorial = true;
  }

  void registrarCadastroDispositivo() {
    usuario = usuario!.copyWith(
      empresaSelecionada: usuario!.empresaSelecionada!.copyWith(
        dadosMultifatorial: usuario!.empresaSelecionada!.dadosMultifatorial!.copyWith(
          statusDispositivo: StatusDispositivoEnum.pendenteHabilitacao,
        ),
      ),
    );
  }

  void registrarSelecaoEmpresa(AcessoEmpresaDTO empresa) {
    usuario = usuario!.copyWith(empresaSelecionada: empresa);
  }

  void registrarSelecaoConta(ContaDTO conta) {
    usuario = usuario!.copyWith(
      empresaSelecionada: usuario!.empresaSelecionada!.copyWith(
        contaSelecionada: conta,
      ),
    );
  }

  StatusDispositivoEnum? obterStatusDispositivo() {
    return usuario?.empresaSelecionada?.dadosMultifatorial?.statusDispositivo;
  }

  String definirRotaAutenticacao() {
    if (usuario!.indicadorTermoResponsabilidade == false) {
      return InternetBankingRotas.termoResponsabilidade;
    }

    if (usuario!.indicadorTrocaSenha) {
      return "";
    }

    if (usuario!.empresaSelecionada == null) {
      return InternetBankingRotas.selecionarEmpresa;
    }

    if (usuario!.empresaSelecionada!.usuarioMaster) {
      if (usuario!.indicadorAtualizacaoCadastral == true) {
        return InternetBankingRotas.atualizacaoCadastralMultifatorial;
      } else if ((usuario!.dispositivo.indicadorNovo == true ||
              usuario!.empresaSelecionada!.dadosMultifatorial!.statusDispositivo ==
                  StatusDispositivoEnum.naoAssociado ||
              usuario!.empresaSelecionada!.dadosMultifatorial!.statusDispositivo == StatusDispositivoEnum.expirado) &&
          erroMultifatorial == false) {
        return InternetBankingRotas.cadastrarDispositivo;
      }
    }

    if (usuario!.empresaSelecionada!.contaSelecionada == null) {
      return InternetBankingRotas.selecionarConta;
    }

    return InternetBankingRotas.home;
  }

  void logoff() {
    usuario = null;
    erroMultifatorial = false;
  }
}
