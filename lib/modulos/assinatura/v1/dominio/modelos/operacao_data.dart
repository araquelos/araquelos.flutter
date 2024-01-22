

import 'package:mobile_pj/modulos/assinatura/v1/dados/DTO/operacao_minificada_dto.dart';

class OperacaoPorData {
  final DateTime data;
  final List<OperacaoMinificadaDTO> operacoes;

  OperacaoPorData({
    required this.data,
    required this.operacoes,
  });
}
