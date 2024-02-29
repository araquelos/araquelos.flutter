enum Months {
  nenhum,
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro
}

enum Tags {
  nenhuma,
  ouvir,
  aprender,
  autoridade,
  autoconhecimento,
  virASer,
  crenca,
  acao,
  bemEMal,
  dependencia,
  apego,
  relacionamento,
  medo,
  desejo,
  sexo,
  casamento,
  paixao,
  inteligencia,
  sentimentos,
  palavras,
  condicionamento,
  energia,
  atencao,
  atencaoSemEscolha,
  violencia,
  felicidade,
  magoa,
  dor,
  tristeza,
  verdade,
  realidade,
  oObservadorEOQueEObservado,
  oQueE,
  intelecto,
  pensamento,
  conhecimento,
  mente,
  tempo,
  percepcao,
  cerebro,
  transformacao,
  viver,
  morrer,
  renascimento,
  amor,
  estarSo,
  religiao,
  deus,
  meditacao
}

class Reflection {
  final String id;
  final String title;
  final int day;
  final Months month;
  final List<String> monthFilters;
  final Tags tag;
  final String imagePath;
  final List<String> paragraphs;

  const Reflection({
    required this.id,
    required this.title,
    this.day = 0,
    this.month = Months.nenhum,
    required this.monthFilters,
    this.tag = Tags.nenhuma,
    required this.imagePath,
    required this.paragraphs,
  });

  String get monthText {
    switch (month) {
      case Months.janeiro:
        return 'Janeiro';
      case Months.fevereiro:
        return 'Fevereiro';
      default:
        return 'Nenhum';
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
      case Tags.virASer:
        return 'Vir a Ser';
      case Tags.crenca:
        return 'Crença';
      case Tags.acao:
        return 'Ação';
      case Tags.bemEMal:
        return 'Bem e Mal';
      case Tags.dependencia:
        return 'Dependência';
      case Tags.apego:
        return 'Apego';
      case Tags.relacionamento:
        return 'Relacionamento';
      case Tags.medo:
        return 'Medo';
      case Tags.desejo:
        return 'Desejo';
      case Tags.sexo:
        return 'Sexo';
      case Tags.casamento:
        return 'Casamento';
      case Tags.paixao:
        return 'Paixão';
      case Tags.inteligencia:
        return 'Inteligência';
      case Tags.sentimentos:
        return 'Sentimentos';
      case Tags.palavras:
        return 'Palavras';
      case Tags.condicionamento:
        return 'Condicionamento';
      case Tags.energia:
        return 'Energia';
      case Tags.atencao:
        return 'Atenção';
      case Tags.atencaoSemEscolha:
        return 'Atenção Sem Escolha';
      case Tags.violencia:
        return 'Violência';
      case Tags.felicidade:
        return 'Felicidade';
      case Tags.magoa:
        return 'Mágoa';
      case Tags.dor:
        return 'Dor';
      case Tags.tristeza:
        return 'Tristeza';
      case Tags.verdade:
        return 'Verdade';
      case Tags.realidade:
        return 'Realidade';
      case Tags.oObservadorEOQueEObservado:
        return 'O Observador e o Que é Observado';
      case Tags.oQueE:
        return 'O Que É';
      case Tags.intelecto:
        return 'Intelecto';
      case Tags.pensamento:
        return 'Pensamento';
      case Tags.conhecimento:
        return 'Conhecimento';
      case Tags.mente:
        return 'Mente';
      case Tags.tempo:
        return 'Tempo';
      case Tags.percepcao:
        return 'Percepção';
      case Tags.cerebro:
        return 'Cérebro';
      case Tags.transformacao:
        return 'Transformação';
      case Tags.viver:
        return 'Viver';
      case Tags.morrer:
        return 'Morrer';
      case Tags.renascimento:
        return 'Renascimento';
      case Tags.amor:
        return 'Amor';
      case Tags.estarSo:
        return 'Estar Só';
      case Tags.religiao:
        return 'Religião';
      case Tags.deus:
        return 'Deus';
      case Tags.meditacao:
        return 'Meditação';
      default:
        return 'Oração';
    }
  }
}
