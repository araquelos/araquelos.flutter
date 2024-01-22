

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movimento_dto.freezed.dart';
part 'movimento_dto.g.dart';

@freezed
class MovimentoDTO with _$MovimentoDTO {
    factory  MovimentoDTO({
    required String data,
    required String descricao,
    required int doc,
    required double valor,
    required String saldo,
    required String canal,

}) = _MovimentoDTO;
factory MovimentoDTO.fromJson(Map<String, dynamic> json) => _$MovimentoDTOFromJson(json);
}