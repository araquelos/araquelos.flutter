enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Reflection {
  final String id;
  final String title;
  final int day;
  final int month;
  final List<String> monthFilters;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Cost cost;
  final bool isJanuary;
  final bool isFebruary;
  final bool isMarch;
  final bool isApril;
  final bool isMay;
  final bool isJune;
  final bool isJuly;
  final bool isAugust;
  final bool isSeptember;
  final bool isOctober;
  final bool isNovember;
  final bool isDecember;

  const Reflection({
    required this.id,
    required this.title,
    required this.day,
    required this.month,
    required this.monthFilters,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.cost,
    this.isJanuary = false,
    this.isFebruary = false,
    this.isMarch = false,
    this.isApril = false,
    this.isMay = false,
    this.isJune = false,
    this.isJuly = false,
    this.isAugust = false,
    this.isSeptember = false,
    this.isOctober = false,
    this.isNovember = false,
    this.isDecember = false,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Normal';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
