import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/interface/assinatura_repositorio.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/repositorios/assinatura_repositorio_impl.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/blocs/assinatura_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/dados_cadastrais_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/gerenciar_dispositivo_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/termo_responsabilidade_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/repositorios/dados_cadastrais_repositorio_impl.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/repositorios/gerenciar_dispositivo_repositorio_impl.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/repositorios/termo_responsabilidade_repositorio_impl.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/atualizacao_cadastral_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/repositorios/autenticacao_repositorio_impl.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/autenticacao_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/cadastrar_dispositivo_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/gerar_token_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/guia_habilitacao_dispositivo_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_conta_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/selecionar_empresa_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/termo_responsabilidade_bloc.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/repositorios/caixa_postal_repositorio_impl.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/comprovante_bloc.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/interface/extrato_repositorio.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/repositorios/extrato_repositorio_impl.dart';
import 'package:mobile_pj/modulos/extrato/v1/dominio/blocs/extrato_bloc.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/blocs/caixa_postal_bloc.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';
import 'package:mobile_pj/modulos/home/v1/dados/repositorios/saldo_repositorio_impl.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/home_page_bloc.dart';
import 'package:mobile_pj/modulos/home/v1/dominio/blocs/saldo_bloc.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/repositorios/comprovante_repositorio_impl.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dominio/blocs/reemissao_comprovante_bloc.dart';
import 'package:mobile_pj/utils/gerenciador_usuario.dart';
import 'package:mobile_pj/utils/http/executor_http.dart';
import 'package:mobile_pj/utils/servicos/digital_servico.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_android_servico.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_ios_servico.dart';
import 'package:mobile_pj/utils/servicos/dispositivo_servico.dart';
import 'package:mobile_pj/utils/servicos/gerenciar_conta_servico.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';
import 'package:mobile_pj/utils/servicos/multifatorial_servico_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt fabrica = GetIt.instance..allowReassignment = true;

Future<void> configurarServicos() async {
  fabrica.registerLazySingleton<IMultifatorialServico>(() {
    return MultifatorialServicoImpl();
  });

  fabrica.registerLazySingleton<GerenciadorUsuario>(() {
    return GerenciadorUsuario();
  });

  fabrica.registerLazySingleton<LocalAuthentication>(() {
    return LocalAuthentication();
  });

  fabrica.registerLazySingleton<DigitalServico>(() {
    return DigitalServico(
      autenticacaoLocal: fabrica<LocalAuthentication>(),
    );
  });

  fabrica.registerFactory<ExecutorHttp>(() {
    return ExecutorHttp();
  });

  fabrica.registerLazySingletonAsync<GerenciarContaServico>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return GerenciarContaServico(
      preferencias: sharedPreferences,
    );
  });

  fabrica.registerLazySingleton<DispositivoServico>(() {
    if (Platform.isAndroid) {
      return DispositivoAndroidServico(
        multifatorialServico: fabrica<IMultifatorialServico>(),
      );
    } else {
      return DispositivoIosServico(
        multifatorialServico: fabrica<IMultifatorialServico>(),
      );
    }
  });
}

Future<void> configurarRepositorios() async {
  fabrica.registerLazySingleton<IAutenticacaoRepositorio>(() {
    return AutenticacaoRepositorioImpl();
  });

  fabrica.registerLazySingleton<ITermoResponsabilidadeRepositorio>(() {
    return TermoResponsabilidadeRepositorioImpl();
  });

  fabrica.registerLazySingleton<IDadosCadastraisRepositorio>(() {
    return DadosCadastraisRepositorioImpl();
  });

  fabrica.registerLazySingleton<IGerenciarDispositivoRepositorio>(() {
    return GerenciarDispositivoRepositorioImpl();
  });

  fabrica.registerLazySingleton<ISaldoRepositorio>(() {
    return SaldoRepositorioImpl();
  });

  fabrica.registerLazySingleton<ICaixaPostalRepositorio>(() {
    return CaixaPostalRepositorioImpl();
  });

  fabrica.registerLazySingleton<IAssinaturaRepositorio>(() {
    return AssinaturaRepositorioImpl();
  });

  fabrica.registerLazySingleton<IExtratoRepositorio>(() {
    return ExtratoRepositorioImpl();
  });

  fabrica.registerLazySingleton<IComprovanteRepositorio>(() {
    return ComprovanteRepositorioImpl();
  });
}

Future<void> configurarBlocs() async {
  fabrica.registerFactory<AutenticacaoBloc>(() {
    return AutenticacaoBloc(
      autenticacaoRepositorio: fabrica<IAutenticacaoRepositorio>(),
      dispositivoServico: fabrica<DispositivoServico>(),
      digitalServico: fabrica<DigitalServico>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactory<TermoResponsabilidadeBloc>(
    () {
      return TermoResponsabilidadeBloc(
        termoResponsabilidadeRepositorio: fabrica<ITermoResponsabilidadeRepositorio>(),
        gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
      );
    },
  );

  fabrica.registerFactory<CadastrarDispositivoBloc>(
    () {
      return CadastrarDispositivoBloc(
        dispositivoServico: fabrica<DispositivoServico>(),
        multifatorialServico: fabrica<IMultifatorialServico>(),
        gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
        gerenciarDispositivoRepositorio: fabrica<IGerenciarDispositivoRepositorio>(),
      );
    },
  );

  fabrica.registerFactory<GuiaHabilitacaoDispositivoBloc>(
    () {
      return GuiaHabilitacaoDispositivoBloc(
        gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
      );
    },
  );

  fabrica.registerFactory<SelecionarEmpresaBloc>(() {
    return SelecionarEmpresaBloc(
      autenticacaoRepositorio: fabrica<IAutenticacaoRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactory<SelecionarContaBloc>(() {
    return SelecionarContaBloc(
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
      autenticacaoRepositorio: fabrica<IAutenticacaoRepositorio>(),
    );
  });

  fabrica.registerFactory<GerarTokenBloc>(() {
    return GerarTokenBloc();
  });

  fabrica.registerFactory<AtualizacaoCadastralBloc>(() {
    return AtualizacaoCadastralBloc(
      dadosCadastraisRepositorio: fabrica<IDadosCadastraisRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactory<SaldoBloc>(() {
    return SaldoBloc(
      saldoRespositorio: fabrica<ISaldoRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactory<HomePageBloc>(() {
    return HomePageBloc(
      caixaPostalRepositorio: fabrica<ICaixaPostalRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactoryParam<AssinaturaBloc, String, void>((filtro, _) {
    return AssinaturaBloc(
      assinaturaRepositorio: fabrica<IAssinaturaRepositorio>(),
      comprovanteRepositorio: fabrica<IComprovanteRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
      parametroFiltro: filtro,
    );
  });

  fabrica.registerFactory<ExtratoBloc>(() {
    return ExtratoBloc(
      extratoRepositorio: fabrica<IExtratoRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
      saldoRepositorio: fabrica<ISaldoRepositorio>(),
    );
  });

  fabrica.registerFactory<CaixaPostalBloc>(() {
    return CaixaPostalBloc(
      caixaPostalRepositorio: fabrica<ICaixaPostalRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });

  fabrica.registerFactoryParam<ComprovanteBloc, String, void>((xml, _) {
    return ComprovanteBloc(
      xmlComprovante: xml,
    );
  });

  fabrica.registerFactory<ReemissaoComprovanteBloc>(() {
    return ReemissaoComprovanteBloc(
      comprovanteRepositorio: fabrica<IComprovanteRepositorio>(),
      gerenciadorUsuario: fabrica<GerenciadorUsuario>(),
    );
  });
}
