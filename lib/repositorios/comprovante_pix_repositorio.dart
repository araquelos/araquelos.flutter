import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/comprovante_pix.dart';

class ComprovantePixRepositorio {
  static ComprovantePix comprovante = ComprovantePix(
    titularOrigem: 'Elizel',
    agenciaOrigem: '0024',
    contaOrigem: '000359043-7',
    tipoContaOrigem: 'Conta Corrente',
    instituicaoDestino: 'BCO DO EST. DO PA S.A',
    titularDestino: 'Leonardo Torres Kawaguchi',
    cpfDestino: '94997799220',
    agenciaDestino: '0047',
    contaDestino: '000363597-0',
    tipoContaDestino: 'Conta Corrente',
    idDestino: '89DA4200FEA149BE8C3417E6720FD114',
    tipoPagamentoDestino: 'Manual',
    finalidadeDestino: 'Compra ou Transferência',
    valor: 150,
    descricaoDestino: 'Teste Assinatura Mobile 8',
    autenticacaoDestino: '638266584100900000',
  );
}
