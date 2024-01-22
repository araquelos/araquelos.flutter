part of 'termo_responsabilidade_bloc.dart';

sealed class TermoResponsabilidadeEvent extends ReplayEvent {}

class TermoResponsabilidadeEventAceiteTermo extends TermoResponsabilidadeEvent {}

class TermoResponsabilidadeEventRecusaTermo extends TermoResponsabilidadeEvent {}
