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
    day: 26,
    month: 2,
    monthFilters: ['m2'],
    cost: Cost.cheap,
    complexity: Complexity.simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isFebruary: true,
  ),
];
