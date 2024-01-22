import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/conta_token.dart';

class EmpresaToken {
  final String nome;
  final String cnpj;
  final List<ContaToken> contas;

  const EmpresaToken({
    required this.nome,
    required this.cnpj,
    required this.contas,
  });
}
