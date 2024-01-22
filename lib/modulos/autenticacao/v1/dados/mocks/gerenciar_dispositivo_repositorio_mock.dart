import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/renomear_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/interface/gerenciar_dispositivo_repositorio.dart';

class GerenciarDispositivoRepositorioMock extends IGerenciarDispositivoRepositorio {
  @override
  Future<void> renomear({required String codigoSessao, required RenomearRequisicaoDTO modelo}) async {}

  @override
  Future<AssociarDispositivoMultifatorialRespostaDTO> associarIdentificadorMultifatorial(
      {required String codigoSessao, required AssociarDispositivoMultifatorialRequisicaoDTO modelo}) async {
    return AssociarDispositivoMultifatorialRespostaDTO(
      dataExpiracao: DateTime.now().add(const Duration(days: 1)),
      dataExpirada: false,
    );
  }
}
