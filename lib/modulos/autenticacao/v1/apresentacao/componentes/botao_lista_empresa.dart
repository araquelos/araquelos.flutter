import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque_base.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_empresa_bloc.dart';

class BotaoListaEmpresa extends StatelessWidget {
  final AcessoEmpresaDTO empresa;

  const BotaoListaEmpresa({
    Key? key,
    required this.empresa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotaoDestaqueBase(
      tema: BotaoDestaqueTemaEnum.lista,
      icone: SvgPicture.asset(
        InternetBankingAssetsIcones.empresa,
        height: 30,
        width: 30,
      ),
      labelSuperior: "Nome",
      valorSuperior: empresa.nome,
      labelInferior: "CNPJ",
      valorInferior: UtilBrasilFields.obterCnpj(empresa.cnpj),
      aoClicar: () {
        context
            .read<SelecionarEmpresaBloc>()
            .add(SelecionarEmpresaEventEmpresaSelecionada(empresaSelecionada: empresa));
      },
    );
  }
}
