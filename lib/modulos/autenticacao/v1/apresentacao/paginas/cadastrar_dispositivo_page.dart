import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/nome_dispositivo_validador.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/cadastrar_dispositivo_bloc.dart';
import 'package:mobile_pj/utils/servicos/alerta_servico.dart';
import 'package:mobile_pj/utils/servicos/navegador_servico.dart';

part 'cadastrar_dispositivo_aviso_part_page.dart';
part 'cadastrar_dispositivo_nomear_part_page.dart';
part 'cadastrar_dispositivo_aviso_primeira_habilitacao_part_page.dart';
part 'cadastrar_dispositivo_aviso_nova_habilitacao_part_page.dart';
part 'cadastrar_dispositivo_aviso_otp_expirado_part_page.dart';
part 'cadastrar_dispositivo_erro_multifatorial_part_page.dart';

class CadastrarDispositivoPage extends StatelessWidget {
  const CadastrarDispositivoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CadastrarDispositivoBloc, CadastrarDispositivoState>(
      listener: (context, state) {
        AlertaServico.utilitario(context, state);
        NavegadorServico.utilitario(context, state);
      },
      child: BlocBuilder<CadastrarDispositivoBloc, CadastrarDispositivoState>(
        builder: (context, state) {
          switch (state.etapa) {
            case CadastrarDispositivoEtapa.exibirAviso:
              return const EtapaAviso();
            case CadastrarDispositivoEtapa.exibirNomearDispositivo:
              return const EtapaNomearDispositivo();
            case CadastrarDispositivoEtapa.exibirAvisoPrimeiraHabilitacao:
              return const EtapaAvisoPrimeiraHabilitacao();
            case CadastrarDispositivoEtapa.exibirAvisoOTPExpirado:
              return const EtapaAvisoOtpExpirado();
            case CadastrarDispositivoEtapa.exibirAvisoNovaHabilitacao:
              return const EtapaAvisoNovaHabilitacao();
            case CadastrarDispositivoEtapa.exibirErroCadastroMultifatorial:
              return const EtapaErroMultifatorial();
            case null:
              context.read<CadastrarDispositivoBloc>().add(EventoIniciar());
              return const PlaceholderCarregamento();
          }
        },
      ),
    );
  }
}
