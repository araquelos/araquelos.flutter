import '../models/month.dart';
import '../models/reflection.dart';

const dummyMonths = [
  Month(
    id: 'm1',
    title: 'Janeiro',
  ),
  Month(
    id: 'm2',
    title: 'Fevereiro',
  ),
  Month(
    id: 'm3',
    title: 'Março',
  ),
  Month(
    id: 'm4',
    title: 'Abril',
  ),
  Month(
    id: 'm5',
    title: 'Maio',
  ),
  Month(
    id: 'm6',
    title: 'Junho',
  ),
  Month(
    id: 'm7',
    title: 'Julho',
  ),
  Month(
    id: 'm8',
    title: 'Agosto',
  ),
  Month(
    id: 'm9',
    title: 'Setembro',
  ),
  Month(
    id: 'm10',
    title: 'Outubro',
  ),
  Month(
    id: 'm11',
    title: 'Novembro',
  ),
  Month(
    id: 'm12',
    title: 'Dezembro',
  ),
];

const dummyMessages = [
  Reflection(
    id: 'r1',
    title: 'Ouvir com Facilidade',
    day: 1,
    month: Months.janeiro,
    monthFilters: ['m1'],
    isJanuary: true,
    tag: Tags.ouvir,
    imagePath: 'assets/images/01-01.jpg',
    paragraphs: [
      'Já alguma vez se sentaram muito silenciosamente, sem que a vossa atenção esteja fixada em coisa alguma, sem fazerem qualquer esforço para se concentrarem, mas com a mente muito silenciosa, completamente quieta?\n\nEntão ouvem tudo, não ouvem?\n\nOuvem os ruídos distantes tão bem quanto aqueles que estão mais perto e aqueles que estão muito próximos, os sons circundantes — o que significa realmente que estão a ouvir tudo.\n\nA vossa mente não se encontra confinada a um pequeno canal estreito.\n\nSe conseguirem ouvir desta maneira, ouvir com facilidade, sem esforço, descobrirão que uma mudança extraordinária está a ter lugar dentro de vós, uma mudança que surge sem que a tenham desejado, sem que a tenham pedido; e nessa mudança existe uma grande beleza e uma percepção imediata e profunda.'
    ],
  ),
];
