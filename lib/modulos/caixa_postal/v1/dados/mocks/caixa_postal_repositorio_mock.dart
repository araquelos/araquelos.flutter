import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/excluir_mensagens_requisicao_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/mensagem_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/DTO/obter_quantidade_mensagens_nao_lidas_dto.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dados/interface/caixa_postal_repositorio_interface.dart';
import 'package:mobile_pj/modulos/caixa_postal/v1/dominio/enum/status_mensagem_caixa_postal.dart';

class CaixaPostalRepositorioMock extends ICaixaPostalRepositorio {
  @override
  Future<ObterQuantidadeMensagensNaoLidasDTO> obterQuantidadeMensagensNaoLidas({required String codigoSessao}) async {
    return const ObterQuantidadeMensagensNaoLidasDTO(valor: 8);
  }

  @override
  Future excluirMensagens({required String codigoSessao, required ExcluirMensagensRequisicaoDTO modelo}) async {
    return const ExcluirMensagensDTO(respostaPadrao: "OK");
  }

  @override
  Future marcarMensagemComoLida({required String codigoSessao, int? idMensagem}) {
    throw UnimplementedError();
  }

  @override
  Future<List<MensagemDTO>> obterMensagens({required String codigoSessao}) async {
    return <MensagemDTO>[
      MensagemDTO(
        id: 1,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você fez um Pix no valor de R\$ 25,00 para Renan Rodrigues.",
        status: StatusMensagemCaixaPostalEnum.nova,
        titulo: "Pix",
      ),
      MensagemDTO(
        id: 2,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você fez uma Transferência no valor de R\$ 300,00 para Tárcio Caldas.",
        status: StatusMensagemCaixaPostalEnum.nova,
        titulo: "Transferência",
      ),
      MensagemDTO(
        id: 3,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você realizou uma compra, no crédito, na BIG BEM BR, no valor de R\$ 55,00.",
        status: StatusMensagemCaixaPostalEnum.excluida,
        titulo: "Crédito",
      ),
      MensagemDTO(
        id: 4,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você realizou uma compra, no débito, no SUPER. LIDER DOCA, no valor de R\$ 138,00.",
        status: StatusMensagemCaixaPostalEnum.nova,
        titulo: "Débito",
      ),
      MensagemDTO(
        id: 5,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você fez um Pix no valor de R\$ 200,00 para Marina Ribeiro.",
        status: StatusMensagemCaixaPostalEnum.lida,
        titulo: "Pix",
      ),
      MensagemDTO(
        id: 6,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você fez um Pix no valor de R\$ 200,00 para Marina Ribeiro.",
        status: StatusMensagemCaixaPostalEnum.lida,
        titulo: "Pix",
      ),
      MensagemDTO(
        id: 7,
        dataHoraEnvio: DateTime(2023, 11, 17),
        descricao: "Você fez um Pix no valor de R\$ 200,00 para Marina Ribeiro.",
        status: StatusMensagemCaixaPostalEnum.lida,
        titulo: "Pix",
      ),
    ];
  }
}
