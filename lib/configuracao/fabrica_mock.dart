// ignore_for_file: unused_import

import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/interface/assinatura_repositorio.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/mocks/assinatura_repositorio_mock.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/dados_cadastrais_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/gerenciar_dispositivo_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/termo_responsabilidade_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/mocks/autenticacao_repositorio_mock.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/mocks/dados_cadastrais_repositorio_mock.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/mocks/gerenciar_dispositivo_repositorio_mock.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/mocks/termo_responsabilidade_repositorio_mock.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/mocks/caixa_postal_repositorio_mock.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/interface/extrato_repositorio.dart';
import 'package:mobile_pj/modulos/extrato/v1/dados/mocks/extrato_repositorio_mock.dart';
import 'package:mobile_pj/modulos/home/v1/dados/interface/saldo_repositorio_intertace.dart';
import 'package:mobile_pj/modulos/home/v1/dados/mocks/saldo_repositorio_mock.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/mocks/comprovante_repositorio_mock.dart';
import 'package:mobile_pj/utils/servicos/interfaces/multifatorial_servico.dart';
import 'package:mobile_pj/utils/servicos/mocks/multifatorial_servico_mock.dart';

Future<void> configurarServicosMock() async {
  // fabrica.registerLazySingleton<IMultifatorialServico>(() {
  //   return MultifatorialServicoMock();
  // });
}

Future<void> configurarRepositoriosMock() async {
  fabrica.registerLazySingleton<IAutenticacaoRepositorio>(() {
    return AutenticacaoRepositorioMock();
  });

  fabrica.registerLazySingleton<ITermoResponsabilidadeRepositorio>(() {
    return TermoResponsabilidadeRepositorioMock();
  });

  fabrica.registerLazySingleton<IDadosCadastraisRepositorio>(() {
    return DadosCadastraisRepositorioMock();
  });

  fabrica.registerLazySingleton<IGerenciarDispositivoRepositorio>(() {
    return GerenciarDispositivoRepositorioMock();
  });

  fabrica.registerLazySingleton<ISaldoRepositorio>(() {
    return SaldoRepositorioMock();
  });

  fabrica.registerLazySingleton<ICaixaPostalRepositorio>(() {
    return CaixaPostalRepositorioMock();
  });

  fabrica.registerLazySingleton<IAssinaturaRepositorio>(() {
    return AssinaturaRepositorioMock();
  });

  fabrica.registerLazySingleton<IExtratoRepositorio>(() {
    return ExtratoRepositorioMock();
  });

  fabrica.registerLazySingleton<IComprovanteRepositorio>(() {
    return ComprovanteRepositorioMock();
  });
}
