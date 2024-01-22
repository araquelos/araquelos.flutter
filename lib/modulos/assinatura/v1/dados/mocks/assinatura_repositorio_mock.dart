import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/assinar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/buscar_quantidade_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/cancelar_response_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/dado_operacao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_paginadas_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/listar_operacoes_requisicao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_assinatura_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_detalhada_resposta_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_minificada_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/usuario_dto.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dados/interface/assinatura_repositorio.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/status_operacao_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_assinatura_enum.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/tipo_dado_operacao_enum.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

class AssinaturaRepositorioMock extends IAssinaturaRepositorio {
  @override
  Future<AssinarResponseDTO> assinar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    return const AssinarResponseDTO(
      valor: StatusOperacaoEnum.executado,
    );
  }

  @override
  Future<BuscarQuantidadeResponseDTO> buscarQuantidade({
    required FiltroAssinaturaTipoTransacaoEnum filtro,
    required String codigoSessao,
  }) async {
    return const BuscarQuantidadeResponseDTO(
      valor: 100,
    );
  }

  @override
  Future<CancelarResponseDTO> cancelar({
    required int idOperacao,
    required String codigoSessao,
  }) {
    // TODO: implement cancelar
    throw UnimplementedError();
  }

  @override
  Future<OperacaoDetalhadaRespostaDTO> consultarOperacao({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    return OperacaoDetalhadaRespostaDTO(
        id: 1,
        descricao: "TRANSFERÊNCIA-TED",
        dataHoraRegistro: DateTime(2023, 09, 15),
        valor: 100,
        status: StatusOperacaoEnum.pendente,
        transacao: TransacaoDTO(codigo: '1', descricao: "TRANSFERÊNCIA-TED"),
        usuarioRegistro: UsuarioDTO(cpf: '12345612345', nome: 'Leonardo'),
        assinaturasNecessarias: 3,
        assinaturasEfetuadas: 2,
        assinaturas: <OperacaoAssinaturaDTO>[
          OperacaoAssinaturaDTO(
              cpfUsuario: '12312345612',
              nomeUsuario: 'Leonardo da Silva',
              tipoAssinatura: TipoAssinaturaEnum.assinatura,
              dataHoraRegistro: DateTime(2023, 09, 15)),
        ],
        dados: <DadoOperacaoDTO>[
          DadoOperacaoDTO(
            chave: 'Dados do Boleto',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
              chave: 'Linha digitavel do codigo de barra',
              valor: '10493.39573 82000.100048 00000.148486 1 98710000001345',
              tipo: TipoDadoOperacaoEnum.info),
          DadoOperacaoDTO(
            chave: 'Número único do boleto',
            valor: '2018032100007542224',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Instituição emissora',
            valor: '085-COOPCENTRAL AILOS',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: '',
            valor: '',
            tipo: TipoDadoOperacaoEnum.breakLine,
          ),
          DadoOperacaoDTO(
            chave: 'Beneficiário Original',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
            chave: 'CPF/CNPJ beneficiário original',
            valor: '66431980468',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Razão social',
            valor: 'KUGGRQEG JDAHEZEBKUD KO QABYO',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Beneficiário Final',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
            chave: 'CPF/CNPJ beneficiário original',
            valor: '66431980468',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Razão social',
            valor: 'KUGGRQEG JDAHEZEBKUD KO QABYO',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Dados do Pagador',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
            chave: 'CPF/CNPJ do pagador',
            valor: '88951227241',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Nome do pagador',
            valor: 'ADRIANA CLAUDIA M FRANCA',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Dados do Pagador Final',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
            chave: 'CPF/CNPJ do pagador',
            valor: '88951227241',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Nome do pagador',
            valor: 'ADRIANA CLAUDIA M FRANCA',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Dados do Pagamento',
            valor: '',
            tipo: TipoDadoOperacaoEnum.label,
          ),
          DadoOperacaoDTO(
            chave: 'Valor nominal',
            valor: '150,00',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Encargos',
            valor: '0,00',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Descontos',
            valor: '0,00',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Abatimentos',
            valor: '0,00',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Valor total a pagar',
            valor: '150,00',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Data de Vencimento',
            valor: '10/10/2023',
            tipo: TipoDadoOperacaoEnum.info,
          ),
          DadoOperacaoDTO(
            chave: 'Data/Hora do pagamento',
            valor: '10/10/2023 18:16:59',
            tipo: TipoDadoOperacaoEnum.info,
          ),
        ]);
  }

  @override
  Future<ListarOperacoesPaginadasRespostaDTO> listarOperacoesPaginadas({
    required String codigoSessao,
    required ListarOperacoesRequisicaoDTO corpoRequisicao,
  }) async {
    return ListarOperacoesPaginadasRespostaDTO(
      lista: <OperacaoMinificadaDTO>[
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "TRANSFERÊNCIA-TED",
          dataHoraRegistro: DateTime(2023, 09, 15),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "TRANSFERÊNCIA-DOC",
          dataHoraRegistro: DateTime(2023, 09, 18),
          valor: 1000,
          status: StatusOperacaoEnum.executado,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "PIX",
          dataHoraRegistro: DateTime(2023, 09, 18),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "PAGAMENTO BOLETO",
          dataHoraRegistro: DateTime(2023, 09, 17),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "TRANSFERÊNCIA-TED",
          dataHoraRegistro: DateTime(2023, 09, 17),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "TRANSFERÊNCIA-TED",
          dataHoraRegistro: DateTime(2023, 09, 19),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
        OperacaoMinificadaDTO(
          id: 1,
          descricao: "PAGAMENTO BOLETO",
          dataHoraRegistro: DateTime(2023, 09, 19),
          valor: 1000,
          status: StatusOperacaoEnum.pendente,
          assinaturasEfetuadas: 2,
          assinaturasNecessarias: 3,
        ),
      ],
      paginador: PaginadorDTO(
        pagina: corpoRequisicao.paginador.pagina,
        totalRegistros: 100,
        totalPaginas: 5,
        registrosPorPagina: 20,
      ),
    );
  }

  @override
  Future permiteAssinar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    return;
  }

  @override
  Future permiteCancelar({
    required int idOperacao,
    required String codigoSessao,
  }) async {
    return;
  }
}
