import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/associar_dispositivo_multifatorial_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/renomear_requisicao_dto.dart';

abstract class IGerenciarDispositivoRepositorio {
  Future<void> renomear({required String codigoSessao, required RenomearRequisicaoDTO modelo});
  Future<AssociarDispositivoMultifatorialRespostaDTO> associarIdentificadorMultifatorial(
      {required String codigoSessao, required AssociarDispositivoMultifatorialRequisicaoDTO modelo});
}
