import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_requisicao_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/autenticar_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/detalhar_empresa_resposta_dto.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dados/DTO/selecionar_conta_requisicao_dto.dart';

abstract class IAutenticacaoRepositorio {
  Future<AutenticarRespostaDTO> autenticar(AutenticarRequisicaoDTO modelo);
  Future<AutenticarRespostaDTO> derrubarSessao(String token);
  Future<DetalharEmpresaRespostaDTO> detalharEmpresa(String codigoSessao, String cnpj);
  Future selecionarConta(SelecionarContaRequisicaoDTO conta, String codigoSessao, bool ehSelecaoApp);
}
