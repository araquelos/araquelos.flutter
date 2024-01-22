import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/formularios/campo_sms_token.dart';
import 'package:mobile_pj/componentes/formularios/campo_telefone_formulario.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/constantes/internet_banking_strings.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/formularios/contato_formulario.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/email_validador.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/telefone_validador.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/atualizacao_cadastral_bloc.dart';
import 'package:mobile_pj/utils/auxiliares/mascara_utils.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

part 'atualizacao_cadastral_contato_part_page.dart';
part 'atualizacao_cadastral_formulario_part_page.dart';
part 'atualizacao_cadastral_sms_token_part_page.dart';

class AtualizacaoCadastralPage extends StatefulWidget {
  const AtualizacaoCadastralPage({super.key});

  @override
  State<AtualizacaoCadastralPage> createState() => _AtualizacaoCadastralPageState();
}

class _AtualizacaoCadastralPageState extends State<AtualizacaoCadastralPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtualizacaoCadastralBloc, AtualizacaoCadastralState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      builder: (context, state) {
        switch (state.etapa) {
          case AtualizacaoCadastralEtapa.exibirAviso:
            return const AtualizacaoCadastralAviso();
          case AtualizacaoCadastralEtapa.exibirFormularioAtualizacao:
            return const AtualizacaoCadastralFormulario();
          case AtualizacaoCadastralEtapa.exibirInserirToken:
            return const AtualizacaoCadastralSmsToken();
          case null:
            return const PlaceholderCarregamento();
        }
      },
    );
  }
}
