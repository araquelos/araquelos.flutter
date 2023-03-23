import 'dart:math';

import 'package:desafio_vibe/modelos/ted.dart';
import 'package:flutter/material.dart';

class Teds with ChangeNotifier {
  final Map<String, Ted> _itens = {};

  List<Ted> get all {
    return [..._itens.values];
  }

  void put(Ted ted) {
    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(
        id,
        () => Ted(
            id: id,
            codBanco: ted.codBanco,
            agencia: ted.agencia,
            conta: ted.conta,
            cpf: ted.cpf,
            valor: ted.valor,
            data: ted.data));

    notifyListeners();
  }

  void remove(Ted ted) {
    _itens.remove(ted.id);
    notifyListeners();
  }
}
