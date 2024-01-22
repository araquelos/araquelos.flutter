import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/comprovante_minificado_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_comprovantes_paginados_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/obter_xml_por_operacao_resposta_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/transacao_dto.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/interface/comprovante_repositorio.dart';
import 'package:mobile_pj/utils/auxiliares/DTO/paginador_dto.dart';

class ComprovanteRepositorioMock implements IComprovanteRepositorio {
  @override
  Future<List<TransacaoDTO>> listarTransacoes() async {
    var lista = <TransacaoDTO>[];

    for (int i = 1; i <= 30; i++) {
      lista.add(
        TransacaoDTO(
          codigo: "$i",
          descricao: "Transação Mock $i",
        ),
      );
    }

    return lista;
  }

  @override
  Future<ObterComprovantesPaginadosRespostaDTO> obterComprovantesPaginados({
    required String codigoSessao,
    required String codigoTransacao,
    required PaginadorDTO paginador,
  }) async {
    var lista = <ComprovanteMinificadoDTO>[];

    for (int i = 1; i <= 30; i++) {
      lista.add(
        ComprovanteMinificadoDTO(
          valor: 100.0 * i,
          dataHoraRegistro: DateTime.now().add(Duration(days: -i)),
          descricao: "Comprovante Mock $i",
          html: "",
          xml:
              "<?xml version=\"1.0\" encoding=\"utf-8\"?><Comprovante><Campo valor=\"\" descricao=\"&lt;b>Dados de Origem&lt;/b>\" aviso=\"false\"/><Campo valor=\"MARCIO MORAES ADVOCACIA SOCIEDADE SIMPLES\" descricao=\"Titular\" aviso=\"false\"/><Campo valor=\"0024\" descricao=\"Agência\" aviso=\"false\"/><Campo valor=\"000359043-7\" descricao=\"Conta\" aviso=\"false\"/><Campo valor=\"Conta Corrente\" descricao=\"Tipo de Conta\" aviso=\"false\"/><Campo valor=\"&amp;nbsp;\" descricao=\"&amp;nbsp;\" aviso=\"false\"/><Campo valor=\"\" descricao=\"&lt;b>Dados de Destino&lt;/b>\" aviso=\"false\"/><Campo valor=\"BCO DO EST. DO PA S.A.\" descricao=\"Instituição\" aviso=\"false\"/><Campo valor=\"LEONARDO TORRES KAWAGUCHI\" descricao=\"Titular\" aviso=\"false\"/><Campo valor=\"***.977.992-**\" descricao=\"CPF\" aviso=\"false\"/><Campo valor=\"0047\" descricao=\"Agência\" aviso=\"false\"/><Campo valor=\"000363597-0\" descricao=\"Conta\" aviso=\"false\"/><Campo valor=\"Conta Corrente\" descricao=\"Tipo de Conta\" aviso=\"false\"/><Campo valor=\"&amp;nbsp;\" descricao=\"&amp;nbsp;\" aviso=\"false\"/><Campo valor=\"89DA4200FEA149BE8C3417E6720FD114\" descricao=\"Identificador da Transação\" aviso=\"false\"/><Campo valor=\"Manual\" descricao=\"Tipo de Pagamento\" aviso=\"false\"/><Campo valor=\"Compra ou Transferência\" descricao=\"Finalidade\" aviso=\"false\"/><Campo valor=\"R\$ 0,01 (Um Centavo)\" descricao=\"Valor\" aviso=\"false\"/><Campo valor=\"Teste assinatura mobile 8\" descricao=\"Descrição\" aviso=\"false\"/><Campo valor=\"638266584100900000\" descricao=\"Autenticação\" aviso=\"false\"/><Campo valor=\"Informamos que poderá incidir tarifa sobre esta transação. Consulte nossa tabela de tarifas vigente disponível no site institucional para maiores detalhes\" descricao=\"ATENÇÃO\" aviso=\"true\"/></Comprovante>",
        ),
      );
    }

    return ObterComprovantesPaginadosRespostaDTO(
      lista: lista,
      paginador: PaginadorDTO(
        pagina: paginador.pagina,
        totalPaginas: 5,
        registrosPorPagina: 20,
        totalRegistros: 100,
      ),
    );
  }

  @override
  Future<ObterXmlPorOperacaoRespostaDTO> obterXmlPorOperacao({
    required String codigoSessao,
    required int idOperacao,
    required bool ehReemissao,
  }) async {
    return ObterXmlPorOperacaoRespostaDTO(
      valor:
          "<?xml version=\"1.0\" encoding=\"utf-8\"?><Comprovante><Campo valor=\"\" descricao=\"&lt;b>Dados de Origem&lt;/b>\" aviso=\"false\"/><Campo valor=\"MARCIO MORAES ADVOCACIA SOCIEDADE SIMPLES\" descricao=\"Titular\" aviso=\"false\"/><Campo valor=\"0024\" descricao=\"Agência\" aviso=\"false\"/><Campo valor=\"000359043-7\" descricao=\"Conta\" aviso=\"false\"/><Campo valor=\"Conta Corrente\" descricao=\"Tipo de Conta\" aviso=\"false\"/><Campo valor=\"&amp;nbsp;\" descricao=\"&amp;nbsp;\" aviso=\"false\"/><Campo valor=\"\" descricao=\"&lt;b>Dados de Destino&lt;/b>\" aviso=\"false\"/><Campo valor=\"BCO DO EST. DO PA S.A.\" descricao=\"Instituição\" aviso=\"false\"/><Campo valor=\"LEONARDO TORRES KAWAGUCHI\" descricao=\"Titular\" aviso=\"false\"/><Campo valor=\"***.977.992-**\" descricao=\"CPF\" aviso=\"false\"/><Campo valor=\"0047\" descricao=\"Agência\" aviso=\"false\"/><Campo valor=\"000363597-0\" descricao=\"Conta\" aviso=\"false\"/><Campo valor=\"Conta Corrente\" descricao=\"Tipo de Conta\" aviso=\"false\"/><Campo valor=\"&amp;nbsp;\" descricao=\"&amp;nbsp;\" aviso=\"false\"/><Campo valor=\"89DA4200FEA149BE8C3417E6720FD114\" descricao=\"Identificador da Transação\" aviso=\"false\"/><Campo valor=\"Manual\" descricao=\"Tipo de Pagamento\" aviso=\"false\"/><Campo valor=\"Compra ou Transferência\" descricao=\"Finalidade\" aviso=\"false\"/><Campo valor=\"R\$ 0,01 (Um Centavo)\" descricao=\"Valor\" aviso=\"false\"/><Campo valor=\"Teste assinatura mobile 8\" descricao=\"Descrição\" aviso=\"false\"/><Campo valor=\"638266584100900000\" descricao=\"Autenticação\" aviso=\"false\"/><Campo valor=\"Informamos que poderá incidir tarifa sobre esta transação. Consulte nossa tabela de tarifas vigente disponível no site institucional para maiores detalhes\" descricao=\"ATENÇÃO\" aviso=\"true\"/></Comprovante>",
    );
  }
}
