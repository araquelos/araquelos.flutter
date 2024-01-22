import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque_base.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_conta_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';

class BotaoListaConta extends StatelessWidget {
  final ContaDTO conta;

  const BotaoListaConta({
    super.key,
    required this.conta,
  });

  @override
  Widget build(BuildContext context) {
    return BotaoDestaqueBase(
      tema: BotaoDestaqueTemaEnum.lista,
      icone: conta.tipoConta == TipoContaEnum.contaCorrente
          ? SvgPicture.asset(
              InternetBankingAssetsIcones.contaCorrente,
              height: 30,
              width: 30,
            )
          : SvgPicture.asset(
              InternetBankingAssetsIcones.contaPoupanca,
              height: 30,
              width: 30,
            ),
      labelSuperior: "Agência",
      valorSuperior: conta.agencia.toString(),
      labelInferior: "Conta",
      valorInferior: conta.numeroConta.toString(),
      aoClicar: () {
        context.read<SelecionarContaBloc>().add(SelecionarContaEventContaSelecionada(contaSelecionada: conta));
      },
    );
  }
}
