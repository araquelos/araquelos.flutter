part of 'saldo_bloc.dart';

enum SaldoEtapa {
  detalharSaldoContaCorrente,
  detalharSaldoContaPoupanca,
}

class SaldoState extends IEstadoComEtapa<SaldoState, SaldoEtapa> {
  final bool indicadorVisibilidade;
  final double? saldoTotal;
  final double? saldoDisponivelSaque;
  final SaldoContaCorrenteResponseDTO? saldoContaCorrente;
  final SaldoContaPoupancaResponseDTO? saldoContaPoupanca;

  SaldoState({
    super.etapa,
    required this.indicadorVisibilidade,
    required this.saldoTotal,
    required this.saldoDisponivelSaque,
    required this.saldoContaCorrente,
    required this.saldoContaPoupanca,
  });

  @override
  SaldoState copyWith({
    SaldoEtapa? Function()? etapa,
    bool Function()? indicadorVisibilidade,
    double? Function()? saldoTotal,
    double? Function()? saldoDisponivelSaque,
    SaldoContaCorrenteResponseDTO? Function()? saldoContaCorrente,
    SaldoContaPoupancaResponseDTO? Function()? saldoContaPoupanca,
  }) {
    return alterarEstado(
      novaInstancia: SaldoState(
        etapa: avaliarFuncao(funcao: etapa, valorAtual: this.etapa),
        indicadorVisibilidade: avaliarFuncao(funcao: indicadorVisibilidade, valorAtual: this.indicadorVisibilidade),
        saldoTotal: avaliarFuncao(funcao: saldoTotal, valorAtual: this.saldoTotal),
        saldoDisponivelSaque: avaliarFuncao(funcao: saldoDisponivelSaque, valorAtual: this.saldoDisponivelSaque),
        saldoContaCorrente: avaliarFuncao(funcao: saldoContaCorrente, valorAtual: this.saldoContaCorrente),
        saldoContaPoupanca: avaliarFuncao(funcao: saldoContaPoupanca, valorAtual: this.saldoContaPoupanca),
      ),
    );
  }
}
