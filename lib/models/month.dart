import 'package:flutter/material.dart';

class Month {
  final String id;
  final String title;
  final Color color;

  const Month({
    required this.id,
    required this.title,
    this.color = Colors.lime,
  });
}
