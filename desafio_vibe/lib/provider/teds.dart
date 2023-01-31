import 'dart:math';

import 'package:desafio_vibe/modelos/ted.dart';
import 'package:flutter/material.dart';

class Teds with ChangeNotifier {
  final Map<String, Ted> _itens = {};

  List<Ted> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Ted byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put (Ted ted) {
    if(ted == null) {
      return;
    }

    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(id, () => Ted(
      id: id, 
      codBanco: ted.codBanco, 
      agencia: ted.agencia, 
      conta: ted.conta, 
      cpf: ted.cpf, 
      valor: ted.valor, 
      data: ted.data));

      notifyListeners();
  }
}