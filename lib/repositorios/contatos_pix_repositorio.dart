import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';

class ContatosPixRepositorio {
  static List<RecebedorPix> contato = [
    RecebedorPix(
        nome: 'Contato 1',
        cpf: '12345678901',
        chavePix: 'email@email.com',
        tipoChavePix: 'E-mail',
        instituicao: 'Banco 1'),
    RecebedorPix(
        nome: 'Contato 2',
        cpf: '23456789012',
        chavePix: '91988776655',
        tipoChavePix: 'Celular',
        instituicao: 'Banco 2'),
    RecebedorPix(
        nome: 'Contato 3', cpf: '34567890123', chavePix: '34567890123', tipoChavePix: 'Cpf', instituicao: 'Banco 3'),
    RecebedorPix(
        nome: 'Contato Copia e Cola',
        cpf: '45678901234',
        chavePix: '45678901234',
        tipoChavePix: 'Cpf',
        instituicao: 'Banco 4',
        valor: 1.99,
        descricaoTpTransacao: 'Transferência'),
    RecebedorPix(
      nome: 'Contato QrCode',
      cpf: '56789012345',
      chavePix: '56789012345',
      tipoChavePix: 'Cpf',
      instituicao: 'Banco 5',
      valor: 1.99,
      dataVencimento: DateTime.now().toString(),
      dataExpiracao: DateTime.now().add(const Duration(days: 7)).toString(),
    )
  ];
}
