import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/assinatura/v1/apresentacao/paginas/assinatura_page.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/blocs/assinatura_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/atualizacao_cadastral_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/cadastrar_dispositivo_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/guia_habilitacao_dispositivo_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/atualizacao_cadastral_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/autenticacao_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/termo_responsabilidade_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/selecionar_conta_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/paginas/selecionar_empresa_page.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/autenticacao_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/cadastrar_dispositivo_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/guia_habilitacao_dispositivo_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_conta_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_empresa_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/termo_responsabilidade_bloc.dart';
import 'package:mobile_pj/modulos/comprovante/v1/apresentacao/comprovante_page.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/comprovante_bloc.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';
import 'package:mobile_pj/modulos/extrato/v1/apresentacao/paginas/extrato_page.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/apresentacao/paginas/caixa_postal_page.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/modulos/home/v1/apresentacao/paginas/home_page.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/home_page_bloc.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';
import 'package:mobile_pj/modulos/comprovante/v1/apresentacao/reemissao_comprovante_page.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/reemissao_comprovante_bloc.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/area_pix_page.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_copia_e_cola.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_copia_e_cola_etapa_2.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_ler_qr_code.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_ler_qr_code_etapa_1.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_ler_qr_code_etapa_2.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_pagar_transferir.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_pagar_transferir_comprovante.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_pagar_transferir_etapa_1.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_pagar_transferir_etapa_2.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/paginas/pix_pagar_transferir_etapa_3.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';
import '../modulos/pix/v1/apresentacao/paginas/pix_copia_e_cola_etapa_1.dart';

var router = GoRouter(
  routes: [
    GoRoute(
      name: InternetBankingRotas.autenticacao,
      path: InternetBankingRotas.autenticacao,
      builder: (context, state) {
        return BlocProvider<AutenticacaoBloc>(
          create: (context) => fabrica<AutenticacaoBloc>()..add(AutenticacaoEventIniciar()),
          child: const AutenticacaoPage(),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.home,
      path: InternetBankingRotas.home,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<HomePageBloc>(
                create: (context) => fabrica<HomePageBloc>()..add(HomePageEventIniciar()),
              ),
              BlocProvider<SaldoBloc>(
                create: (context) => fabrica<SaldoBloc>(),
              )
            ],
            child: const HomePage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.termoResponsabilidade,
      path: InternetBankingRotas.termoResponsabilidade,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<TermoResponsabilidadeBloc>(
            create: (context) => fabrica<TermoResponsabilidadeBloc>(),
            child: const TermoResponsabilidadePage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.atualizacaoCadastralMultifatorial,
      path: InternetBankingRotas.atualizacaoCadastralMultifatorial,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<AtualizacaoCadastralBloc>(
            create: (context) => fabrica<AtualizacaoCadastralBloc>(),
            child: const AtualizacaoCadastralPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.cadastrarDispositivo,
      path: InternetBankingRotas.cadastrarDispositivo,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<CadastrarDispositivoBloc>(
            create: (context) => fabrica<CadastrarDispositivoBloc>(),
            child: const CadastrarDispositivoPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.guiaHabilitacaoMultifatorial,
      path: InternetBankingRotas.guiaHabilitacaoMultifatorial,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<GuiaHabilitacaoDispositivoBloc>(
            create: (context) => fabrica<GuiaHabilitacaoDispositivoBloc>(),
            child: const GuiaHabilitacaoDispositivoPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.selecionarEmpresa,
      path: InternetBankingRotas.selecionarEmpresa,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<SelecionarEmpresaBloc>(
            create: (context) => fabrica<SelecionarEmpresaBloc>(),
            child: const SelecionarEmpresaPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.selecionarConta,
      path: InternetBankingRotas.selecionarConta,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<SelecionarContaBloc>(
            create: (context) => fabrica<SelecionarContaBloc>(),
            child: const SelecionarContaPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.assinatura,
      path: InternetBankingRotas.assinatura,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AssinaturaBloc>(
                create: (context) =>
                    fabrica<AssinaturaBloc>(param1: state.uri.queryParameters["filtro"])..add(AssinaturaEventIniciar()),
              ),
              BlocProvider<SaldoBloc>(
                create: (context) => fabrica<SaldoBloc>(),
              ),
            ],
            child: const AssinaturaPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.extrato,
      path: InternetBankingRotas.extrato,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ExtratoBloc>(
                create: (context) => fabrica<ExtratoBloc>()..add(ExtratoEventIniciar()),
              ),
              BlocProvider<SaldoBloc>(
                create: (context) => fabrica<SaldoBloc>(),
              ),
            ],
            child: const ExtratoPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.caixaPostal,
      path: InternetBankingRotas.caixaPostal,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<CaixaPostalBloc>(
            create: (context) => fabrica<CaixaPostalBloc>(),
            child: const CaixaPostalPage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.comprovante,
      path: InternetBankingRotas.comprovante,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<ComprovanteBloc>(
            create: (context) =>
                fabrica<ComprovanteBloc>(param1: state.uri.queryParameters['xml'])..add(ComprovanteEventIniciar()),
            child: ComprovantePage(),
          ),
        );
      },
    ),
    GoRoute(
      name: InternetBankingRotas.reemissaoComprovante,
      path: InternetBankingRotas.reemissaoComprovante,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<ReemissaoComprovanteBloc>(
            create: (context) => fabrica<ReemissaoComprovanteBloc>()..add(ReeemissaoComprovanteEventIniciar()),
            child: ReemissaoComprovantePage(),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.areaPix,
      name: InternetBankingRotas.areaPix,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const AreaPix(),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixPagarTransferir,
      name: InternetBankingRotas.pixPagarTransferir,
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const PixPagarTransferir(),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixPagarTransferirEtapa1,
      name: InternetBankingRotas.pixPagarTransferirEtapa1,
      builder: (context, state) => PixPagarTransferirEtapa1(
        colar: state.extra != null ? state.extra as bool : false,
      ),
    ),
    GoRoute(
      path: InternetBankingRotas.pixPagarTransferirEtapa2,
      name: InternetBankingRotas.pixPagarTransferirEtapa2,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixPagarTransferirEtapa2(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixPagarTransferirEtapa3,
      name: InternetBankingRotas.pixPagarTransferirEtapa3,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixPagarTransferirEtapa3(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixPagarTransferirComprovante,
      name: InternetBankingRotas.pixPagarTransferirComprovante,
      builder: (context, state) {
        return const PixPagarTransferirComprovante();
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixLerQrCode,
      name: InternetBankingRotas.pixLerQrCode,
      builder: (context, state) {
        return const PixLerQrCode();
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixLerQrCodeEtapa1,
      name: InternetBankingRotas.pixLerQrCodeEtapa1,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixLerQrCodeEtapa1(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixLerQrCodeEtapa2,
      name: InternetBankingRotas.pixLerQrCodeEtapa2,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixLerQrCodeEtapa2(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixCopiaECola,
      name: InternetBankingRotas.pixCopiaECola,
      builder: (context, state) => PixCopiaECola(
        colar: state.extra != null ? state.extra as bool : false,
      ),
    ),
    GoRoute(
      path: InternetBankingRotas.pixCopiaEColaEtapa1,
      name: InternetBankingRotas.pixCopiaEColaEtapa1,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixCopiaEColaEtapa1(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
    GoRoute(
      path: InternetBankingRotas.pixCopiaEColaEtapa2,
      name: InternetBankingRotas.pixCopiaEColaEtapa2,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SaldoBloc>(
              create: (context) => fabrica<SaldoBloc>(),
            )
          ],
          child: PixCopiaEColaEtapa2(
            recebedorPix: state.extra != null
                ? state.extra as RecebedorPix
                : RecebedorPix(nome: 'Contato Não Salvo', chavePix: '', cpf: '', instituicao: '', tipoChavePix: ''),
          ),
        );
      },
    ),
  ],
);

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ),
        ),
        child: child,
      );
    },
  );
}
