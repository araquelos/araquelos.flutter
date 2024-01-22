import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/acesso_empresa_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/conta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_contato_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dados_multifatorial_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/detalhar_empresa_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/dispositivo_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/selecionar_conta_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/telefone_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/autenticacao_repositorio.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/status_dispositivo_enum.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_acesso_empresa_enum.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_autenticacao_enum.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/enum/tipo_conta_enum.dart';

class AutenticacaoRepositorioMock extends IAutenticacaoRepositorio {
  @override
  Future<AutenticarRespostaDTO> autenticar(AutenticarRequisicaoDTO modelo) async {
    return AutenticarRespostaDTO(
      codigoSessao: "CODIGO_SESSAO_MOCK",
      cpf: "01673601243",
      nome: "USUARIO MOCK",
      dadosContato: DadosContatoDTO(
        email: "renan.ramos@vibetecnologia.com",
        telefone: TelefoneDTO(
          ddd: "91",
          numero: "984343063",
        ),
      ),
      empresas: <AcessoEmpresaDTO>[
        AcessoEmpresaDTO(
          nome: "EMPRESA MOCK",
          cnpj: "95.522.107/0001-06",
          usuarioMaster: true,
          contas: <ContaDTO>[
            ContaDTO(
              agencia: 11,
              numeroConta: 1111111,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 22,
              numeroConta: 2222222,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 33,
              numeroConta: 3333333,
              tipoConta: TipoContaEnum.contaPoupanca,
              titularidade: 1,
            ),
          ],
          contaSelecionada: null,
          dadosMultifatorial: DadosMultifatorialDTO(
            dataGlobalLimiteOtpExpirado: false,
            dataGlobalLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dataLimiteOtpExpirado: false,
            dataLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dispositivoPendenteCadastroMultifatorial: false,
            existeDispositivoHabilitado: false,
            habilitadoMultifatorial: false,
            statusDispositivo: StatusDispositivoEnum.naoAssociado,
            tipoAutenticacao: TipoAutenticacaoEnum.multifatorial,
          ),
          status: TipoAcessoEmpresaEnum.ativo,
        ),
        AcessoEmpresaDTO(
          nome: "EMPRESA MOCK 2",
          cnpj: "95.522.107/0001-06",
          usuarioMaster: true,
          contas: <ContaDTO>[
            ContaDTO(
              agencia: 11,
              numeroConta: 1111111,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 22,
              numeroConta: 2222222,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 33,
              numeroConta: 3333333,
              tipoConta: TipoContaEnum.contaPoupanca,
              titularidade: 1,
            ),
          ],
          contaSelecionada: null,
          dadosMultifatorial: DadosMultifatorialDTO(
            dataGlobalLimiteOtpExpirado: false,
            dataGlobalLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dataLimiteOtpExpirado: false,
            dataLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dispositivoPendenteCadastroMultifatorial: false,
            existeDispositivoHabilitado: false,
            habilitadoMultifatorial: false,
            statusDispositivo: StatusDispositivoEnum.naoAssociado,
            tipoAutenticacao: TipoAutenticacaoEnum.multifatorial,
          ),
          status: TipoAcessoEmpresaEnum.ativo,
        ),
        AcessoEmpresaDTO(
          nome: "EMPRESA MOCK 3",
          cnpj: "95.522.107/0001-06",
          usuarioMaster: true,
          contas: <ContaDTO>[
            ContaDTO(
              agencia: 11,
              numeroConta: 1111111,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 22,
              numeroConta: 2222222,
              tipoConta: TipoContaEnum.contaCorrente,
              titularidade: 1,
            ),
            ContaDTO(
              agencia: 33,
              numeroConta: 3333333,
              tipoConta: TipoContaEnum.contaPoupanca,
              titularidade: 1,
            ),
          ],
          contaSelecionada: null,
          dadosMultifatorial: DadosMultifatorialDTO(
            dataGlobalLimiteOtpExpirado: false,
            dataGlobalLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dataLimiteOtpExpirado: false,
            dataLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
            dispositivoPendenteCadastroMultifatorial: false,
            existeDispositivoHabilitado: false,
            habilitadoMultifatorial: false,
            statusDispositivo: StatusDispositivoEnum.naoAssociado,
            tipoAutenticacao: TipoAutenticacaoEnum.multifatorial,
          ),
          status: TipoAcessoEmpresaEnum.ativo,
        )
      ],
      empresaSelecionada: AcessoEmpresaDTO(
        nome: "EMPRESA MOCK 3",
        cnpj: "95.522.107/0001-06",
        usuarioMaster: true,
        contas: <ContaDTO>[
          ContaDTO(
            agencia: 11,
            numeroConta: 1111111,
            tipoConta: TipoContaEnum.contaCorrente,
            titularidade: 1,
          ),
          ContaDTO(
            agencia: 22,
            numeroConta: 2222222,
            tipoConta: TipoContaEnum.contaCorrente,
            titularidade: 1,
          ),
          ContaDTO(
            agencia: 33,
            numeroConta: 3333333,
            tipoConta: TipoContaEnum.contaPoupanca,
            titularidade: 1,
          ),
        ],
        contaSelecionada: ContaDTO(
          agencia: 11,
          numeroConta: 1111111,
          tipoConta: TipoContaEnum.contaCorrente,
          titularidade: 1,
        ),
        dadosMultifatorial: DadosMultifatorialDTO(
          dataGlobalLimiteOtpExpirado: false,
          dataGlobalLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
          dataLimiteOtpExpirado: false,
          dataLimiteUtilizacaoOTP: DateTime.now().add(const Duration(days: 1)),
          dispositivoPendenteCadastroMultifatorial: false,
          existeDispositivoHabilitado: false,
          habilitadoMultifatorial: false,
          statusDispositivo: StatusDispositivoEnum.naoAssociado,
          tipoAutenticacao: TipoAutenticacaoEnum.multifatorial,
        ),
        status: TipoAcessoEmpresaEnum.ativo,
      ),
      dispositivo: DispositivoDTO(
        canal: "APP",
        dataHoraUltimoAcesso: DateTime.now().toString(),
        id: 0,
        indicadorNovo: true,
        ipUltimoAcesso: null,
        marca: "MARCA MOCK",
        modelo: "MODELO MOCK",
        nome: "NOME DISPOSITIVO MOCK",
        sistemaOperacional: "SISTEMA OPERACIONAL MOCK",
      ),
      indicadorTermoResponsabilidade: false,
      indicadorAtualizacaoCadastral: false,
      indicadorTrocaSenha: false,
      motivoTrocaSenha: null,
    );
  }

  @override
  Future<AutenticarRespostaDTO> derrubarSessao(String token) async {
    // TODO: implement derrubarSessao
    throw UnimplementedError();
  }

  @override
  Future<DetalharEmpresaRespostaDTO> detalharEmpresa(String codigoSessao, String cnpj) async {
    // TODO: implement detalharEmpresa
    throw UnimplementedError();
  }

  @override
  Future selecionarConta(SelecionarContaRequisicaoDTO conta, String? codigoSessao, bool ehSelecaoApp) async {
    return null;
  }
}
