part of 'saldo_bloc.dart';

sealed class SaldoEvent extends ReplayEvent {}

class SaldoEventAlternarVisibilidade extends SaldoEvent {}

class SaldoEventDetalharSaldo extends SaldoEvent {}

class SaldoEventFecharDetalhamentoSaldo extends SaldoEvent {}
