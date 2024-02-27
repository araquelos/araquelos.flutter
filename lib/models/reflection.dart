enum Months { janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro }

enum Tags { ouvir, aprender, autoridade, autoconhecimento }

class Reflection {
  final String id;
  final String title;
  final int day;
  final Months month;
  final List<String> monthFilters;
  final Tags tag;
  final String imagePath;
  final List<String> paragraphs;
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
    required this.tag,
    required this.imagePath,
    required this.paragraphs,
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

  String get monthText {
    switch (month) {
      case Months.janeiro:
        return 'Janeiro';
      case Months.fevereiro:
        return 'Fevereiro';
      default:
        return 'Desconhecido';
    }
  }

  int get monthInt {
    switch (month) {
      case Months.janeiro:
        return 1;
      case Months.fevereiro:
        return 2;
      default:
        return 0;
    }
  }

  String get tagText {
    switch (tag) {
      case Tags.ouvir:
        return 'Ouvir';
      case Tags.aprender:
        return 'Aprender';
      case Tags.autoridade:
        return 'Autoridade';
      case Tags.autoconhecimento:
        return 'Autoconhecimento';
      default:
        return 'Desconhecido';
    }
  }
}
