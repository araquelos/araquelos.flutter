part of 'comprovante_bloc.dart';

enum EtapaComprovante {
  etapaExibirComprovante,
}

class ComprovanteState extends IEstadoComEtapa<ComprovanteState, EtapaComprovante> {
  final String xmlComprovante;
  final Comprovante? comprovante;

  ComprovanteState({
    required super.etapa,
    required this.xmlComprovante,
    required this.comprovante,
  });

  @override
  ComprovanteState copyWith({
    EtapaComprovante? Function()? etapa,
    String Function()? xmlComprovante,
    Comprovante? Function()? comprovante,
  }) {
    return alterarEstado(
      novaInstancia: ComprovanteState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        xmlComprovante: avaliarFuncao(funcao: xmlComprovante, valorAtual: this.xmlComprovante),
        comprovante: avaliarFuncao(funcao: comprovante, valorAtual: this.comprovante),
      ),
    );
  }
}
