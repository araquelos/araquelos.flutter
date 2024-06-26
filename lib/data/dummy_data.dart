import '../models/month.dart';
import '../models/reflection.dart';

const dummyMonths = [
  Month(
    id: 'jan',
    title: 'Janeiro',
  ),
  Month(
    id: 'fev',
    title: 'Fevereiro',
  ),
  Month(
    id: 'mar',
    title: 'Março',
  ),
  Month(
    id: 'abr',
    title: 'Abril',
  ),
  Month(
    id: 'mai',
    title: 'Maio',
  ),
  Month(
    id: 'jun',
    title: 'Junho',
  ),
  Month(
    id: 'jul',
    title: 'Julho',
  ),
  Month(
    id: 'ago',
    title: 'Agosto',
  ),
  Month(
    id: 'set',
    title: 'Setembro',
  ),
  Month(
    id: 'out',
    title: 'Outubro',
  ),
  Month(
    id: 'nov',
    title: 'Novembro',
  ),
  Month(
    id: 'dez',
    title: 'Dezembro',
  ),
];

const dummyReflections = [
  Reflection(
    id: '0',
    title: 'Oração Diária 📌',
    monthFilters: [''],
    imagePath: 'assets/images/oracao.jpg',
    paragraphs: [
      'Oh Deus me levanto para fazer a Tua vontade! O que Você precisa de mim hoje? Em que posso Te servir? Concede-me, ó Senhor, que eu possa orar não somente com minha boca, mas orar também desde as profundezas do meu coração. Peço que me ajude a ampliar minha consciência para o fato de que Tu estás no controle de tudo, incluindo todas as situações e pessoas da minha vida. Reitero que minha jornada é como Tu desejas para mim, e sou grata por Tê-lo na minha vida. Por mim mesma eu não sou nada! Peço que me conceda o conhecimento de Sua vontade, força e coragem, e rezo todo dia para evitar minhas antigas ações, a fim de que eu seja de utilidade para os outros. Concedei-me, Senhor, a serenidade necessária para aceitar as coisas que não posso modificar, coragem para modificar aquelas que posso, e sabedoria para distinguir umas das outras. Que seja feita a Vossa vontade e não a minha!'
    ],
  ),
  Reflection(
    id: '1',
    title: 'Ouvir com Facilidade',
    day: 1,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Já alguma vez se sentaram muito silenciosamente, sem que a vossa atenção esteja fixada em coisa alguma, sem fazerem qualquer esforço para se concentrarem, mas com a mente muito silenciosa, completamente quieta? Então ouvem tudo, não ouvem? Ouvem os ruídos distantes tão bem quanto aqueles que estão mais perto e aqueles que estão muito próximos, os sons circundantes — o que significa realmente que estão a ouvir tudo. A vossa mente não se encontra confinada a um pequeno canal estreito. Se conseguirem ouvir desta maneira, ouvir com facilidade, sem esforço, descobrirão que uma mudança extraordinária está a ter lugar dentro de vós, uma mudança que surge sem que a tenham desejado, sem que a tenham pedido; e nessa mudança existe uma grande beleza e uma percepção imediata e profunda.'
    ],
  ),
  Reflection(
    id: '2',
    title: 'Colocar os Véus de Lado',
    day: 2,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'De que forma ouvem? Ouvem com as vossas projeções, através da vossa projeção, através das vossas ambições, desejos, medos, ansiedades, ouvindo apenas aquilo que desejam ouvir, apenas aquilo que vos satisfará, que será gratificante, que proporcionará conforto, que irá aliviar, no momento, o vosso sofrimento? Se ouvirem através do véu dos vossos desejos, então estão obviamente a ouvir a vossa própria voz, estão a ouvir os vossos próprios desejos. E haverá alguma outra forma de ouvir? Não será importante descobrirmos como ouvir não apenas o que está a ser dito, mas tudo. Os ruídos da rua, o chilrear dos pássaros, o barulho do eléctrico, o mar revolto, a voz do vosso marido, a vossa mulher, os vossos amigos, o choro de um bebé? O ouvir só é importante quando não estamos a projetar os nossos próprios desejos naquilo que estamos a ouvir. Será possível colocarmos de lado todos estes véus através dos quais ouvimos, e sermos capazes de ouvir realmente?'
    ],
  ),
  Reflection(
    id: '3',
    title: 'Para Além do Ruído das Palavras',
    day: 3,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Ouvir é uma arte a que não se chega facilmente, mas nela residem uma grande beleza e uma grande compreensão. Ouvimos com várias profundidades do nosso ser, mas o nosso ouvir tem sempre lugar a partir de uma concepção prévia ou de um determinado ponto de vista. Não ouvimos simplesmente; está sempre lá a intervenção do véu dos nossos próprios pensamentos, conclusões e preconceitos. Para ouvirmos, necessitamos de uma quietude interior, de estarmos libertos da pressão da aquisição, uma atenção descontraída. Este estado de atenção passiva é capaz de ouvir o que está para além da conclusão verbal. As palavras confundem; são apenas os meios exteriores de comunicação; mas para se conversar intimamente, para além do ruído das palavras, deve haver no ouvir uma passividade alerta. Aqueles que amam podem ouvir; mas é extremamente raro encontrar um ouvinte. A maioria de nós anda atrás de resultados, da consecução de objetivos; estamos eternamente a superar e a conquistar, e com tal não conseguimos ouvir nada. É somente no ouvir que escutamos a melodia das palavras.'
    ],
  ),
  Reflection(
    id: '4',
    title: 'Ouvir sem Pensamento',
    day: 4,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não sei se alguma vez ouviram um pássaro. Ouvir alguma coisa exige que a nossa mente esteja silenciosa, não um silêncio místico, silêncio simplesmente. Estou a dizer-vos algo e, para me ouvirem, têm de estar silenciosos, e não com todo o tipo de ideias a zunirem na vossa mente. Quando olham para uma flor, olham para ela, sem estarem a dar-lhe um nome, sem a estarem a classificar, sem dizerem que ela pertence a determinada espécie, quando o fazem, deixam de a ver. Assim, o que vos digo é que ouvir é uma das coisas mais difíceis — ouvir o comunista, o socialista, o deputado, o capitalista, qualquer pessoa, a vossa mulher, os vossos filhos, o vosso vizinho, o condutor do autocarro, o pássaro — apenas ouvir. É só quando ouvem sem nenhuma ideia, sem pensamento, que estão em contato direto; e ao estarem em contato percebem se aquilo que o outro está a dizer é verdadeiro ou falso; torna-se desnecessário discutir.'
    ],
  ),
  Reflection(
    id: '5',
    title: 'Ouvir Traz Liberdade',
    day: 5,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Quando vocês fazem um esforço para ouvir, estão a ouvir? Não será esse mesmo esforço uma distração que não permite que se ouça? Fazem algum esforço quando escutam algo que vos deleita? Vocês não podem estar conscientes da verdade, nem ver o falso como falso, enquanto a vossa mente estiver de alguma forma ocupada com o esforço, com a comparação, com a justificação ou com a condenação. Ouvir é um ato completo em si mesmo; o ato de ouvir traz, em si mesmo, a sua própria liberdade. Mas será que vocês estão verdadeiramente preocupados com o ouvir, ou em alterar o vosso tumulto interior? Se fossem capazes de ouvir, no sentido de estarem conscientes dos vossos conflitos e contradições, sem os forçarem a moldar-se a um qualquer padrão de pensamento em particular, talvez eles cessassem completamente. Compreendem, nós estamos constantemente a tentar ser isto ou aquilo, atingir um determinado estado, ter um determinado tipo de experiência e evitar outro, de forma que a mente está continuamente ocupada com algo; nunca está suficientemente tranquila para ouvir o ruído das suas próprias lutas e dores. Sejam simples, e não tentem tornar-se algo ou obter determinada experiência.'
    ],
  ),
  Reflection(
    id: '6',
    title: 'Ouvir sem Esforço',
    day: 6,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Vocês estão, neste momento, a ouvir-me, não estão a fazer um esforço para prestar atenção, estão apenas a ouvir; e se houver verdade no que estão a ouvir, descobrirão uma mudança notável a ter lugar em vós, uma mudança que não é premeditada ou almejada, uma transformação, uma revolução completa na qual só a verdade pontifica e não as criações da vossa mente. E se me é permitido sugeri-lo, digo-vos que devem ouvir tudo dessa forma, não apenas o que eu estou a dizer, mas também aquilo que outras pessoas dizem, os pássaros, o silvo de uma locomotiva, o ruído do autocarro que passa. Descobrirão que quanto mais forem capazes de ouvir tudo, maior será o silêncio, e esse silêncio não é, então, quebrado pelo ruído. E somente quando vocês criam resistência em relação a algo, quando erguem uma barreira entre vós e aquilo que não desejam ouvir, é só nesse momento que existe uma luta.'
    ],
  ),
  Reflection(
    id: '7',
    title: 'Ouvirem-se a Vós Mesmos',
    day: 7,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.ouvir,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Questionador: Enquanto me encontro aqui a ouvi-lo, parece que compreendo, mas quando estou longe daqui, não compreendo, embora tente aplicar o que o senhor tem estado a dizer. Krishnamurti: Está a ouvir-se a si mesmo, e não o orador. Se estiver a ouvir o orador, ele torna-se o seu líder, a sua forma de conseguir compreender, o que é um horror, uma abominação, porque então terá estabelecido a hierarquia da autoridade. Portanto, o que está a fazer aqui é ouvir-se a si mesmo. Está a olhar para o quadro que o orador está a pintar, que é o seu próprio quadro, não o do orador. Se isto estiver claro, que está a olhar para si próprio, então poderá dizer: "Bom, vejo-me tal como sou, e não quero fazer nada a respeito disso", e fica tudo por aí. Mas se disser: "Vejo-me tal como sou, e tem de haver uma mudança", então começará a trabalhar a partir da sua própria compreensão, o que é inteiramente diferente de pôr em prática o que diz o orador. Mas se, à medida que o orador vai falando, estiver a ouvir-se a si mesmo, então, a partir desse ouvir haverá clareza, haverá sensibilidade; a partir desse ouvir a mente torna-se saudável, forte. Sem obedecer e sem resistir, ela torna-se viva, intensa, e só um tal ser humano pode criar uma nova geração, um novo mundo.'
    ],
  ),
  Reflection(
    id: '8',
    title: 'Olhar com Intensidade',
    day: 8,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Parece-me que aprender é surpreendentemente difícil, tal como o é também o ouvir. Nunca ouvimos nada verdadeiramente, porque a nossa mente não está livre, os nossos ouvidos estão entupidos com as coisas que já conhecemos, e portanto o ato de ouvir torna-se extraordinariamente difícil. Penso, ou melhor, é um fato, que se conseguirmos ouvir algo com todo o nosso ser, com vigor, com vitalidade, então o próprio acto de ouvir torna-se um fator libertador. Mas infelizmente vocês nunca ouvem realmente, pois nunca aprendem a fazê-lo. Afinal, só aprendem quando oferecem todo o vosso ser a algo. Quando vocês se entregam com todo o vosso ser à matemática, aprendem, mas quando se encontram num estado de contradição, quando não querem aprender, mas são forçados a fazê-lo, nessas circunstâncias a aprendizagem torna-se um mero processo de acumulação. Aprender é como ler um romance com inúmeras personagens; requer a vossa total atenção, não uma atenção contraditória. Se quiserem conhecer uma folha, uma folha primaveril ou uma folha estival, devem olhá-la verdadeiramente, ver a simetria que há nela, a sua textura, a qualidade da folha vivente. Existe beleza, existe vigor, existe vitalidade numa simples folha. Portanto, para conhecerem a folha, a flor, a nuvem, o pôr-do-sol ou um ser humano, têm de olhar com toda a intensidade.'
    ],
  ),
  Reflection(
    id: '9',
    title: 'Para Aprender, a Mente Deve Estar Silenciosa',
    day: 9,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para descobrirem algo novo vocês devem começar a fazê-lo sozinhos; devem iniciar uma caminhada completamente desnudados, especialmente no que diz respeito ao conhecimento, porque é muito fácil, através do conhecimento e da crença, ter experiências; mas tais experiências são meros produtos da autoprojeção, e como tal completamente irreais, falsas. Se quiserem descobrir por vós mesmos o que é o novo, não é bom carregarem o fardo do que é velho, especialmente o conhecimento, o conhecimento que têm do outro, por maior que seja. Vocês usam o conhecimento como um meio de proteção de vós mesmos, de segurança, e querem ter a certeza absoluta de que irão ter as mesmas experiências que teve Buda ou Cristo, ou o senhor X. Mas alguém que está constantemente a proteger-se através do conhecimento não é, obviamente, alguém que procura a verdade. Nenhum caminho conduz à descoberta da verdade. Quando vocês querem encontrar algo novo, quando estão a experimentar o que quer que seja, a vossa mente tem de estar muito silenciosa, não é assim? Se a vossa mente estiver apinhada, a transbordar de fatos, conhecimento, eles funcionam como um impedimento ao novo. A dificuldade, para a maioria de nós, reside no fato de a mente se ter tornado tão importante, tão predominantemente significativa, que interfere constantemente com tudo o que possa ser novo, com qualquer coisa que possa existir em simultâneo com o que é conhecido. Assim, o conhecimento e o aprender são impedimentos para aqueles que procuram, para aqueles que tentam compreender aquilo que é intemporal.'
    ],
  ),
  Reflection(
    id: '10',
    title: 'Aprender Não É Experiência',
    day: 10,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A palavra aprender tem uma grande importância. Existem dois tipos de aprendizagem. Para a maioria de nós, aprender significa acumular conhecimento, experiência, tecnologia, uma habilidade, uma língua. Existe também a aprendizagem psicológica, o aprender através da experiência, ou das experiências imediatas da vida, que deixam um certo resíduo, da tradição, da raça, da sociedade. Existem estas duas formas de aprender a encarar a vida: psicológica e fisiológica; a capacidade exterior e a capacidade interior. Não existe verdadeiramente uma linha de demarcação entre as duas; elas justapõem-se. De momento, não estamos a falar da habilidade que aprendemos através da prática, do conhecimento tecnológico que adquirimos através do estudo. Aquilo de que estamos a tratar é da aprendizagem psicológica que fomos fazendo ao longo dos séculos ou que herdámos sob a forma de tradição, de conhecimento, de experiência. A isto chamamos aprender, mas questiono se isso tem alguma coisa que ver com aprender. Não me refiro a aprender uma habilidade, uma língua, uma técnica, mas estou a perguntar se a mente alguma vez aprende em termos psicológicos. Ela aprendeu, e com o que aprendeu enfrenta o desafio da vida. Está sempre a traduzir a vida ou o novo desafio à luz daquilo que aprendeu. É isso que andamos a fazer. Isso é aprender?  Não implicará o aprender algo novo, algo que desconheço e que estou a aprender? Se estou simplesmente a acrescentar ao que já conheço, então isso já não é aprender.'
    ],
  ),
  Reflection(
    id: '11',
    title: 'Quando É Que Se Torna Possível Aprender?',
    day: 11,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Investigar e aprender são funções da mente. Por aprender não quero referir-me ao mero cultivo da memória ou à acumulação de conhecimento, mas à capacidade de pensar com clareza e com sanidade, sem ilusões, de partir de fatos e não de crenças e de ideais. Não existe nenhuma aprendizagem se o pensamento tiver origem em conclusões. A mera aquisição de informação ou de conhecimento não é aprender. Aprender implica o amor de com­preender e o amor de fazer uma coisa por ela própria. Só é pos­sível aprender quando não existe qualquer tipo de coerção. E a coerção pode assumir muitas formas, não é verdade? Existe coer­ção através da influência, através do apego ou da ameaça, através do encorajamento persuasivo ou de subtis formas de recompensa. A maioria das pessoas julga que a aprendizagem é encorajada pela comparação, quando de fato, é o contrário que acontece. A comparação faz surgir a frustração e só encoraja a inveja, a que é dado o nome de competição. Tal como outras formas de per­suasão, a comparação impede a aprendizagem e alimenta o medo.'
    ],
  ),
  Reflection(
    id: '12',
    title: 'A Aprendizagem Nunca É Acumulativa',
    day: 12,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Aprender é uma coisa e adquirir conhecimento é outra. Apren­der é um processo contínuo, não um processo de adição, não um processo em que se acumula e a partir daí se age em consonân­cia. A maioria de nós acumula conhecimento sob a forma de memória, de ideias, armazena-o como experiência e, a partir daí, age. Isto é, nós agimos com base no conhecimento, no conheci­mento tecnológico, no conhecimento enquanto experiência, no conhecimento enquanto tradição, no conhecimento que se obtém através das nossas tendências idiossincráticas particulares; com esse fundo, com essa acumulação sob a forma de conhecimento, de experiência, de tradição, agimos. Nesse processo não existe aprendizagem. Aprender nunca é um ato acumulativo; é um movimento constante. Não sei se alguma vez se colocaram esta questão: o que é aprender e o que é a aquisição de conhecimen­to? A aprendizagem nunca é acumulativa. Não se pode arma­zenar aprendizagem e então, a partir desse armazém, tomarmos as nossas ações. Aprendemos à medida que caminhamos. Assim, nunca existe um momento de regressão, ou deterioração, ou de declínio.'
    ],
  ),
  Reflection(
    id: '13',
    title: 'A Aprendizagem Não Tem Passado',
    day: 13,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.aprender,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A sabedoria é algo que tem de ser descoberto por cada um, e não é o resultado do conhecimento. O conhecimento e a sabedo­ria não andam a par. A sabedoria vem quando há a maturidade do autoconhecimento. Sem nos conhecermos a nós mesmos, não é possível a ordem, e portanto não existe virtude alguma. Agora, aprendermos acerca de nós mesmos e acumularmos conhecimento sobre nós mesmos são duas coisas diferentes. Uma mente que está a adquirir conhecimento nunca está a apren­der. O que está a fazer é o seguinte: está a reunir para si própria informação, experiência sob a forma de conhecimento, e a partir do fundo do que reuniu, experimenta, aprende; e portanto nunca está realmente a aprender, mas a conhecer, a adquirir. A aprendizagem acontece sempre no presente ativo; não tem passado. No momento em que vocês dizem a vós mesmos: "Aprendi", a aprendizagem já se tornou conhecimento, e a partir do fundo desse conhecimento podem acumular, traduzir, mas não podem continuar a aprender. Só uma mente que não está a adquirir, mas sempre a aprender, só uma mente assim pode compreender o todo que é esta entidade a que chamamos "eu", o self. Tenho de me conhecer a mim mesmo, a estrutura, a natureza, a importância da entidade no seu todo; mas não posso fazê-lo se estiver sobrecarregado com o fardo do meu conhecimento ante­rior, da minha experiência passada, ou com uma mente que está condicionada, porque nesse caso não estou a aprender, estou ape­nas a interpretar, a traduzir, a olhar com uns olhos que estão já turvados pelo passado.'
    ],
  ),
  Reflection(
    id: '14',
    title: 'A Autoridade Impede a Aprendizagem',
    day: 14,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Habitualmente, aprendemos através do estudo, dos livros, da experiência ou recebendo aulas. Essas são as formas comuns de se aprender. Decoramos o que fazer e o que não fazer, o que pensar e o que não pensar, como sentir, como reagir. Através da experiência, do estudo, da análise, da experimentação, do exame introspectivo, armazenamos conhecimento sob a forma de memória; e a memória, então, dá resposta a outros desafios, a outras exigências, a partir das quais vai aprendendo sempre cada vez mais. O que é aprendido é decorado sob a forma de conhecimento, e esse conhecimento entra em ação sempre que nos deparamos com um desafio ou sempre que temos de fazer algo. Mas eu penso que existe um outro modo completamente diferente de aprender, e vou falar-vos um pouco sobre isso; mas para compreendê-lo e para aprender neste modo diferente, vocês devem estar completamente libertos da autoridade; de outra forma estarão apenas a ser instruídos e irão repetir o que tiverem ouvido. É por isso que é muito importante compreender a natureza da autoridade. A autoridade impede a aprendizagem, aquela aprendizagem que não é acumulação de conhecimento sob a forma de memória. A memória responde sempre com padrões; sem qualquer liberdade. Um homem que está sobrecarregado de conhecimento, de instruções, que está derreado sob o peso das coisas que aprendeu, nunca é livre. Pode ser extraordinariamente erudito, mas a sua acumulação de conhecimento impede-o de ser livre, e portanto ele é incapaz de aprender.'
    ],
  ),
  Reflection(
    id: '15',
    title: 'Destruir É Construir',
    day: 15,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para serem livres, vocês têm de examinar a autoridade, todo o esqueleto da autoridade, despedaçando toda essa coisa abominável. E isso requer energia, verdadeira energia física, e exige também energia psicológica. Mas a energia é destruída, é desperdiçada quando estamos em conflito. Assim, quando se dá a compreensão de todo o processo do conflito, dá-se o fim do próprio conflito, e existe então abundância de energia. Então poderão continuar demolindo a casa que foram construindo ao longo dos séculos e que não tem qualquer significado. Sabem, destruir é construir. Devemos destruir, não os edifícios, não o sistema social ou económico — isto acontece diariamente — mas o psicológico, as defesas conscientes e inconscientes, seguranças que construímos racionalmente, individualmente, profundamente e superficialmente. Devemos desmantelar tudo isso para que possamos ficar totalmente sem defesas, porque temos de estar sem defesas para amarmos e sentirmos afeição. Então podem ver e compreender a ambição, a autoridade; e começam a perceber em que circunstâncias é a autoridade necessária e a que nível, a autoridade da polícia, e apenas essa. Então não existe nenhuma autoridade da aprendizagem, nenhuma autoridade do conhecimento, nenhuma autoridade da capacidade, nenhuma autoridade que a função possa assumir e que se torna um estatuto. Para se compreender toda a autoridade, dos gurus, dos mestres e de outros, é necessário ter-se uma mente muito atenta, um cérebro que vê com clareza, não um cérebro confuso ou entorpecido.'
    ],
  ),
  Reflection(
    id: '16',
    title: 'A Virtude Não Tem Qualquer Autoridade',
    day: 16,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Poderá a mente estar liberta da autoridade, o que significa estar livre do medo, de modo a que já não seja capaz de seguir? Se assim for, isto põe fim à imitação, a qual se torna mecânica. Afinal, a virtude, a ética não são uma repetição daquilo que é bom. A partir do momento em que se torna mecânica, ela deixa de ser virtude. A virtude é algo que tem de acontecer a cada momento, tal como a humildade. A humildade não pode ser cultivada, e uma mente que não tem humildade não é capaz de aprender. Portanto a virtude não tem qualquer autoridade. A moralidade social não é moralidade nenhuma; é imoral, porque admite a competição, a ganância, a ambição, e portanto a sociedade encoraja a imoralidade. A virtude é algo que transcende a moralidade. Sem virtude, não existe ordem, e a ordem não deve existir de acordo com um padrão, de acordo com uma fórmula. Uma mente que, através da autodisciplína, segue uma fórmula para alcançar a virtude, está a criar para si própria os problemas da imoralidade. Uma autoridade exterior pretendida pela mente, com excepção da lei, como Deus, como moral, e assim por diante, torna-se destrutiva quando a mente está a tentar compreender o que é a verdadeira virtude. Nós temos a nossa própria autoridade, sob a forma de experiência, de conhecimento, que tentamos seguir. Existe esta constante repetição, a imitação, que todos nós conhecemos. A autoridade psicológica, não a autoridade da lei, da polícia que está a manter a ordem, a autoridade psicológica, que cada um de nós tem, destrói a virtude, porque a virtude é algo vivo, em movimento. Da mesma forma que não podemos cultivar a humildade, o amor, assim também a virtude não pode ser cultivada; e nisso reside uma grande beleza. A virtude não é mecânica, e sem a virtude não existem bases para se poder pensar com clareza.'
    ],
  ),
  Reflection(
    id: '17',
    title: 'A Mente Velha Está Acorrentada Pela Autoridade',
    day: 17,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O problema é, portanto, este: será possível que uma mente que tem sido tão condicionada, criada no meio de inúmeras seitas, religiões, e todo o tipo de superstições, medos, consiga libertar-se de si mesma e dar assim lugar a uma mente nova? A mente velha é essencialmente, a mente que está acorrentada pela autoridade. Não estou a utilizar o termo autoridade no sentido legal; refiro-me antes à autoridade enquanto tradição, autoridade enquanto conhecimento, autoridade enquanto experiência, autoridade enquanto meio de alcançar segurança e de permanecer nessa segurança, interior e exteriormente, porque, afinal, é isso que a mente procura sem cessar, um local onde possa estar segura, sem perturbações. Uma tal autoridade pode ser a autoridade auto-imposta de uma ideia ou da assim chamada ideia religiosa de Deus, a qual não se reveste de qualquer realidade para aquele que é de fato religioso. Uma ideia não é um fato, é uma ficção. Deus é uma ficção; podem acreditar nele, mas ele continua a ser uma ficção. Contudo, para encontrarem Deus, têm de destruir completamente a ficção, porque a mente velha é a mente que está assustada, que é ambiciosa, que tem medo da morte, de viver, e de estar em relação; e que está sempre, consciente ou inconscientemente, em busca de permanência, de segurança.'
    ],
  ),
  Reflection(
    id: '18',
    title: 'Livre no Começo',
    day: 18,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Se conseguirmos compreender a compulsão que se encontra por detrás do nosso desejo de dominar ou de sermos dominados, então talvez possamos libertarmo-nos dos efeitos debilitantes da autoridade. Ansiamos por ter certezas, por estarmos certos, por termos sucesso, por sabermos; e este desejo de certeza, de permanência, constrói dentro de nós mesmos a autoridade da experiência pessoal, enquanto externamente cria a autoridade da sociedade, da família, da religião, e assim por diante. Mas ignorar, simplesmente, a autoridade, abalar os seus símbolos exteriores tem muito pouco significado. Libertarmo-nos de uma tradição para nos moldarmos a outra, abandonar este líder para começar a seguir aquele, é apenas uma atitude superficial. Se estivermos conscientes de todo o processo da autoridade, se percebermos o quanto esse processo é interno, se compreendermos e conseguirmos transcender o nosso desejo de segurança, então teremos uma ampla compreensão e uma tomada de consciência profunda e instantânea, temos de estar livres não no final, mas no começo.'
    ],
  ),
  Reflection(
    id: '19',
    title: 'Libertação da Ignorância, da Tristeza',
    day: 19,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Ouvimos com esperança e com medo; procuramos a luz de outra pessoa, mas não estamos naquele estado de atenção passiva que nos permite compreender. Se o liberto parece preencher os nossos desejos, aceitamo-lo; caso contrário, continuamos em busca daquele que os preencherá; aquilo que a maioria de nós deseja é a satisfação a diferentes níveis. O importante não é como reconhecer aquele que está liberto, mas como vos compreender a vós mesmos. Nenhuma autoridade presente ou futura vos pode dar conhecimento sobre vós mesmos; sem autoconhecimento, não pode haver libertação da ignorância, da tristeza.'
    ],
  ),
  Reflection(
    id: '20',
    title: 'Por Que Seguimos?',
    day: 20,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Por que aceitamos, por que seguimos? Seguimos a autoridade de outro, a experiência de outro, e depois colocamo-las em dúvida; esta procura da autoridade e a sua sequela, a desilusão, é um processo penoso para a maioria de nós. Culpamos ou criticamos a autoridade que aceitámos no passado, o líder, o professor, mas não examinamos a nossa própria ânsia por uma autoridade que possa orientar a nossa conduta. Uma vez que tenhamos entendido esta ânsia, compreederemos a importância da dúvida.'
    ],
  ),
  Reflection(
    id: '21',
    title: 'A Autoridade Corrompe Tanto o Líder Como Aquele que o Segue',
    day: 21,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Estarmos conscientes de nós mesmos é uma tarefa árdua, e como a maioria de nós prefere um caminho fácil e ilusório, conferimos existência à autoridade que dá uma forma e um padrão à nossa vida. Esta autoridade pode ser o colectivo, o Estado; ou pode ser pessoal, o Mestre, o salvador, o guru. Qualquer tipo de autoridade cega alimenta a negligência; e como a maior parte de nós considera que ser cuidadoso implica dor, entregamo-nos à autoridade. A autoridade engendra o poder, e o poder torna-se sempre centralizado e, como consequência, completamente corrupto; corrompe não só o controlador, mas também aquele que o segue. A autoridade do conhecimento e da experiência perverte, quer esteja investida no Mestre, no seu representante ou no sacerdote. É a vossa própria vida, este conflito aparentemente interminável, é isso que é importante, não o padrão ou o líder. A autoridade do Mestre ou do sacerdote afasta-vos da questão central, que é o conflito dentro de vós.'
    ],
  ),
  Reflection(
    id: '22',
    title: 'Posso Confiar na minha Experiência?',
    day: 22,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A maioria de nós está satisfeita com a autoridade porque ela nos dá uma continuidade, uma certeza, a sensação de estarmos protegidos. Mas alguém que compreenda as implicações desta profunda revolução psicológica tem de estar liberto da autoridade, não é assim? Não pode olhar para nenhuma autoridade, seja ela criada por essa própria pessoa ou imposta por terceiros. E será isto possível? Ser-me-á possível não confiar na autoridade da minha própria experiência? Mesmo quando eu já rejeitei todas as expressões exteriores de autoridade — livros, professores, sacerdotes, igrejas, crenças — continuo a sentir que pelo menos posso confiar no meu próprio julgamento, nas minhas próprias experiências, na minha própria análise. Mas poderei confiar na minha experiência, no meu julgamento, na minha análise? A minha experiência é o resultado do meu condicionamento, da mesma forma que a vossa resulta do vosso condicionamento, não é verdade? Posso ter sido educado como muçulmano, ou budista, ou hindu, e a minha experiência dependerá do meu meio cultural, econômico, social e religioso, tal como a vossa dependerá do meio em que foram educados. E poderei confiar nisso? Posso confiar nisso para me guiar, para me dar esperança, para a visão que me dará a fé no meu próprio julgamento, o qual é, por sua vez, o resultado de memórias e experiências acumuladas, o condicionamento do passado a confrontar-se com o presente? Agora, quando me tiver colocado todas estas questões e estiver consciente deste problema, verei que só pode haver um estado no qual a realidade, o novo, podem existir, e isso origina uma revolução. Esse é o estado em que a mente está completamente liberta do passado, quando não existe nenhum sujeito que analisa, nenhuma experiencia, nenhum julgamento, nenhum tipo de autoridade.'
    ],
  ),
  Reflection(
    id: '23',
    title: 'O Autoconhecimento É um Processo',
    day: 23,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Então, para compreendermos os inúmeros problemas que cada um de nós tem, não é essencial que haja autoconhecimento? E esta é uma das coisas mais difíceis, estarmos atentos a nós mesmos, o que não significa um isolamento, um afastamento. E óbvio que é essencial que nos conheçamos a nós mesmos; mas conhecer-se a si mesmo não implica que haja um afastamento da relação. E certamente seria um erro pensarmos que nos podemos conhecer a nós mesmos profunda, completa e perfeitamente, através do isolamento, através da exclusão, ou indo a um psicólogo, ou a um sacerdote; ou que podemos aprender a conhecermo-nos a nós mesmos através de um livro. O autoconhecimento é, obviamente, um processo, não um fim em si próprio; e, para nos conhecermos devemos estar atentos a nós mesmos quando agimos, o que é estar em relação. Vocês descobrem-se a vós mesmos não no isolamento, não no afastamento, mas na relação, na relação com a sociedade, com a vossa mulher, o vosso marido, o vosso irmão, com a humanidade. Mas descobrirem como reagem, quais são as vossas respostas requer uma extraordinária atenção por parte da mente, uma percepção apurada.'
    ],
  ),
  Reflection(
    id: '24',
    title: 'A Mente sem Amarras',
    day: 24,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A transformação do mundo é originada pela transformação de cada um de nós, porque o eu é o produto e uma parte do processo total da existência humana. Para se transformarem, é essencial o autoconhecimento; sem saberem o que são, não existe qualquer base para o pensamento correto, e sem se conhecerem a vós mesmos não pode haver transformação. Devem conhecer-se tal como são, não como desejam ser, o que é apenas um ideal e portanto fictício, irreal; é somente aquilo que é que pode ser transformado, não aquilo que vocês desejam que seja. Conhecermo-nos tal como realmente somos requer uma extraordinária atenção por parte da mente, porque "o que é" está continuamente em transformação, em mudança; e para o seguir com rapidez e vivacidade, a mente não pode estar amarrada a nenhum dogma, crença ou padrão de ação em particular. Para se seguir algo, não é bom ter-se amarras. Para se conhecerem a vós mesmos, devem ter a consciência, o estado de atenção da mente, no qual há a libertação de todas as crenças, de todas as idealizações, porque as crenças e os ideais apenas nos dão uma cor, pervertendo a verdadeira percepção. Se quiserem saber o que são, não podem imaginar ou acreditar numa coisa que não são. Se sou ganancioso, invejoso, violento, o mero fato de ter um ideal de não-violência, de não ser ganancioso, de nada adianta. A compreensão daquilo que são, o que quer que sejam, feios ou bonitos, malvados ou perversos, a compreensão do que vocês são, sem distorção, é o princípio da virtude. A virtude é essencial, porque dela vem a liberdade.'
    ],
  ),
  Reflection(
    id: '25',
    title: 'Autoconhecimento Ativo',
    day: 25,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Sem o autoconhecimento, a experiência alimenta a ilusão; com o autoconhecimento, a experiência, que é a resposta ao desafio, não deixa um resíduo acumulado sob a forma de memória. O autoconhecimento é a descoberta, a cada momento, dos caminhos do eu, das suas intenções e da sua atividade, dos seus pensamentos e apetites. Nunca poderá existir a "vossa experiência" e a "minha experiência"; o próprio termo "minha experiência" é indicador de ignorância e da aceitação da ilusão.'
    ],
  ),
  Reflection(
    id: '26',
    title: 'Criatividade através do Autoconhecimento',
    day: 26,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não existe nenhum método para o autoconhecimento. Procurar um método implica, invariavelmente, o desejo de obter um determinado resultado, e é isso que todos nós queremos. Seguimos a autoridade — se não aquela de uma pessoa, então a de um sistema, de uma ideologia — porque queremos um resultado que seja satisfatório, que nos dê segurança. Nós realmente não queremos compreendermo-nos a nós mesmos, os nossos impulsos e reações, todo o processo do nosso pensar, o consciente e o inconsciente; preferimos procurar um sistema que nos assegure um resultado. Mas a busca de um sistema é invariavelmente a consequência do nosso desejo de segurança, de certeza, e o resultado não é, obviamente, a compreensão de nós mesmos. Quando seguimos um método, temos de ter autoridades — o professor, o guru, o salvador, o Mestre — que nos garantam aquilo que desejamos; e esse não é certamente o caminho para o autoconhecimento. A autoridade impede a compreensão de nós próprios, não é assim? Sob a protecção de uma autoridade, de um guia, vocês podem ter uma sensação temporária de segurança, uma sensação de bem-estar, mas isso não é a compreensão da totalidade do processo de si mesmo. A própria natureza da autoridade impede a completa consciência de si mesmo e portanto acaba por destruir a liberdade; somente na liberdade pode haver criatividade, e só pode existir criatividade através do autoconhecimento.'
    ],
  ),
  Reflection(
    id: '27',
    title: 'Mente Silenciosa, Mente Simples',
    day: 27,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Quando estamos conscientes de nós mesmos, não se torna todo o movimento do viver um meio de desvendar o "eu", o ego, o self? O self é um processo muito complexo que apenas pode ser revelado através do relacionamento, nas nossas atividade cotidianas, na forma como falamos, na forma como julgamos, calculamos, no modo como condenamos os outros e a nós mesmos. Tudo isso nos dá a conhecer o estado condicionado da nossa própria forma de pensar, e não será importante estarmos conscientes de todo este processo? É somente através da atenção ao que é verdadeiro, momento a momento, que se dá a descoberta do intemporal, do eterno. Sem o autoconhecimenío, o eterno não pode existir. Quando não nos conhecemos a nós mesmos, o eterno torna-se apenas uma palavra, um símbolo, uma especulação, um dogma, uma crença, uma ilusão na qual a mente pode refugiar-se. Mas se começarmos a compreender o "eu" em todas as suas múltiplas atividades, dia a dia, então, nessa mesma compreensão, sem qualquer esforço, o inominável, o intemporal ganha existência. Mas o intemporal não é uma recompensa pelo autoconhccimento. Não se pode procurar obter aquilo que é eterno, a mente não o pode adquirir. O intemporal passa a existir quando a mente está silenciosa, e a mente só pode estar silenciosa quando é simples, quando já não está a acumular, a condenar, a julgar, a pesar. Apenas a mente simples pode compreender o real, não a mente que está cheia de palavras, de conhecimento, de informação. A mente que analisa, que calcula, não é uma mente simples.'
    ],
  ),
  Reflection(
    id: '28',
    title: 'Conhecer-se a Si Mesmo',
    day: 28,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Sem se conhecerem a vós mesmos, façam o que fizerem, não é possível existir o estado de meditação. Por "conhecerem-se a vós mesmos" quero dizer conhecerem cada pensamento, cada estado de espírito, cada palavra, cada sentimento; conhecerem a atividade da vossa mente — não conhecerem o self supremo, o grande self; não existe uma tal coisa; o self mais elevado, o atma, insere-se ainda no campo do pensamento. O pensamento é o resultado do vosso condicionamento, o pensamento é a resposta da vossa memória, ancestral ou recente. E a tentativa de meditar, simplesmente, sem que primeiro tentem estabelecer profunda e irrevogavelmente essa virtude que nasce do autoconhecimento, é completamente ilusória e inútil. Por favor, é muito importante para aqueles que são sérios que compreendam isto. Porque se não o conseguirem fazer, a vossa meditação e o vosso viver estão divorciados, separados de tal forma que embora possam meditar, praticando infinitas posturas, para o resto das vossas vidas não conseguirão ver nada para além do vosso próprio nariz; qualquer postura que pratiquem, qualquer coisa que laçam, será completamente desprovida de significado. É importante compreender o que é este autoconhecimento, o estar simplesmente atento, sem qualquer escolha, ao "eu", que tem a sua fonte num feixe de memórias — estar simplesmente consciente dele sem interpretação, apenas observar o movimento da mente. Mas essa observação é impedida quando estamos apenas a acumular através da observação — o que fazer, o que não fazer, o que alcançar; se fizerem isso, põem fim ao processo vivo do movimento da mente como self. Isto é, eu tenho de observar e ver o fato, o real, o que é. Se me aproximo dele com uma ideia, com uma opinião — tais como "não devo" ou "devo", que são respostas da memória, então o movimento do que é é obstruído é bloqueado; e portanto, não existe aprendizagem.'
    ],
  ),
  Reflection(
    id: '29',
    title: 'Vazio Criativo',
    day: 29,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Será que vocês conseguem ouvir isto daquele modo simples como o solo recebe a semente, e verem se a mente é capaz de ser livre, vazia? Ela só pode estar vazia através da compreensão de todas as suas próprias projeções, das suas próprias atividades, não de forma intermitente, mas a cada dia, a cada momento. Então encontrarão a resposta, então perceberão que a mudança vem sem que a tenham pedido, que o estado de vazio criativo não é algo que possa ser cultivado — está lá, vem misteriosamente, sem convite prévio, e somente nesse estado há a possibilidade de renovação, inovação, revolução.'
    ],
  ),
  Reflection(
    id: '30',
    title: 'Autoconhecimento',
    day: 30,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O pensar correto vem com o autoconhecimento. Sem se conhecerem a vós mesmos, não têm qualquer base para o pensamento; sem o autoconhecimcnto, aquilo que pensam não é verdadeiro. Vocês e o mundo não são duas entidades diferentes com problemas separados; vocês e o mundo são um. O vosso problema é o problema do mundo. Podem ser o resultado de certas tendências, de influências ambientais, mas não são, na essência, diferentes uns dos outros. No nosso interior, somos muito semelhantes; todos nós somos movidos pela ganância, má vontade, medo, ambição, e assim por diante. As nossas crenças, esperanças, aspirações têm uma base comum. Somos um; somos uma humanidade, embora as fronteiras artificiais da economia, da política e do preconceito nos dividam. Se matarem alguém, estão a destruir-se a vós mesmos. Vocês são o centro do todo, e sem se compreenderem a vós próprios, não podem compreender a realidade. Temos um conhecimento intelectual desta unidade, mas mantemos o conhecimento e o sentimento em compartimentos diferentes, e por isso nunca experimentamos a extraordinária unidade do homem.'
    ],
  ),
  Reflection(
    id: '31',
    title: 'O Relacionamento É um Espelho',
    day: 31,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoconhecimento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O autoconhecimento não se processa de acordo com nenhuma fórmula. Vocês podem ir a um psicólogo ou a um psicanalista para descobrir algo sobre vós mesmos, mas isso não é autoconhecimento. O autoconhecimento acontece quando estamos conscientes de nós mesmos no relacionamento, o que nos mostra o que somos de momento a momento. O relacionamento é um espelho no qual nós podemos ver como realmente somos. Contudo, a maioria de nós é incapaz de olhar para si mesma quando está em relação, porque começa imediatamente a condenar ou a justificar o que vê. Julgamos, avaliamos, comparamos, negamos ou aceitamos, mas nunca observamos realmente o que é, e para a maioria das pessoas isto parece ser a coisa mais difícil de fazer; no entanto, é isto, e apenas isto, que é o princípio do autoconhecimento. Se formos capazes de nos vermos tal como somos neste extraordinário espelho que é o relacionamento, que não cria distorções, se conseguirmos olhar para este espelho com total atenção e vermos verdadeiramente o que é, estarmos conscientes do que é sem condenação, sem julgamento, sem avaliação, e conseguimos fazê-lo quando existe um interesse honesto, então descobriremos que a mente é capaz de se libertar de todo o condicionamento; e é só então que a mente está livre para descobrir esse algo que está para além do campo do pensamento. Afinal, independentemente do grau de instrução da mente, ela está consciente ou inconscientemente limitada, condicionada, e qualquer extensão deste condicionamento encontra-se ainda dentro do campo do pensamento. Portanto, a liberdade é algo inteiramente diferente.'
    ],
  ),
  Reflection(
    id: '32',
    title: 'Vir a Ser É uma Luta',
    day: 1,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A vida tal como nós a conhecemos, a nossa vida diária, é um processo de vir a ser. Sou pobre e ajo com um fim em vista, que é o de me tornar rico. Sou feio e quero tornar-me bonito. E por tanto, a minha vida consiste num processo de vir a ser algo. A vontade de ser é a vontade de vir a ser, em níveis diferentes de consciência, em estados diferentes, e nela há desafio, resposta, nomear e registro. Assim, este vir a ser é uma lula, este vir a ser é uma dor, não é verdade? É uma batalha constante: sou isto, e quero vir a ser aquilo.'
    ],
  ),
  Reflection(
    id: '33',
    title: 'Todo o Vir a Ser É Desintegração',
    day: 2,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A mente tem uma ideia, talvez agradável, e quer ser como essa ideia, a qual é uma projeção do vosso desejo. Vocês são isto, algo de que não gostam, e querem vir a ser aquilo, algo de que gostam. O ideal é uma autoprojeção; o oposto é uma extensão "do que é"; não é de forma alguma o oposto, mas uma continuação "do que é", talvez um pouco modificada. A projeção vem da vontade do eu, e o conflito é a luta pela projeção. Vocês estão a lutar por virem a ser algo, e esse algo é parte de vós mesmos. O ideal é a vossa própria projeção. Observem como a mente pregou uma partida a si própria. Vocês estão a debater-se com palavras, perseguindo a vossa própria projeção, a vossa própria sombra. São violentos e lutam por se tornarem não-violentos, o ideal; mas o ideal é uma projeção "do que é", apenas com um nome diferente. Quando vocês tomam consciência desta partida que pregaram a vós próprios, então conseguirão ver o falso como falso. A luta por uma ilusão é o fator de desintegração. Todo o conflito, todo o vir a ser é desintegração. Quando existe a consciência desta partida que a mente pregou a si mesma, então existe apenas "o que é". Quando a mente está liberta de todo o vir a ser, de todos os ideais, de toda a comparação e condenação, quando a sua própria estrutura entrou em colapso, então "o que é" sofreu uma transformação completa.  Enquanto houver a nomeação "do que é", existirá relação entre a mente e "o que é"; mas quando este processo de nomeação, o qual é memória, a própria estrutura da mente, não existe, então "o que é" deixa também de existir. Somente nesta transformação existe integração.'
    ],
  ),
  Reflection(
    id: '34',
    title: 'Poderá a Mente Grosseira Tornar-se Sensível?',
    day: 3,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Prestem atenção à pergunta, ao significado por detrás das palavras. Poderá a mente que é grosseira tornar-se sensível? Se digo que a minha mente é grosseira e tento tornar-me sensível, o próprio esforço para me tornar sensível é grosseiro. Por favor, observem isto. Não fiquem intrigados, mas observem. Ao passo que se eu reconhecer que sou grosseiro, sem tentar tornar-me sensível, se eu começar a compreender o que é a grosseria, observando-a na minha vida, a cada dia, a forma ávida como como, a forma áspera como trato as pessoas, o orgulho, a arrogância, a rudeza dos meus hábitos e pensamentos, então essa mesma observação transforma "o que é". Do mesmo modo, se sou estúpido e digo que me devo tornar inteligente, o esforço por me tornar inteligente é apenas uma forma maior de estupidez: porque o que é importante é compreender a estupidez. Por mais que tente tornar-me inteligente, a minha estupidez permanecerá. Posso adquirir o verniz superficial da educação, posso ser capaz de citar obras literárias, repetir passagens de grandes autores, mas continuarei, basicamente, a ser estúpido. Mas se eu for capaz de ver e de compreender a estupidez tal como ela se expressa na minha vida de todos os dias, como me comporto com o meu empregado, como encaro o meu vizinho, o pobre, o rico, o padre, então essa mesma tomada de consciência faz desaparecer a estupidez.'
    ],
  ),
  Reflection(
    id: '35',
    title: 'Oportunidades de Auto-expansão',
    day: 4,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A estrutura hierárquica oferece uma excelente oportunidade de auto-expansão. Vocês podem desejar que todos sejam irmãos, mas como é que tal pode acontecer se vocês procuram distinções espirituais? Vocês podem rir-se dos títulos mundanos; mas quando admitem a existência do mestre, do salvador, do guru no reino do espírito, não estão justamente a fazer uma transposição da mesma atitude mundana? Poderão existir divisões ou graus hierárquicos no crescimento espiritual, na compreensão da verdade, na compreensão de Deus? O amor não admite divisões. Ou se ama ou não se ama; mas não transformem a falta de amor num processo interminável cujo fim é o amor. Quando sabemos, não amamos, quando estamos conscientes desse fato através da atenção sem escolha, então existe a possibilidade de transformação; mas cultivar laboriosamente esta distinção entre o Mestre e o discípulo, entre aqueles que alcançaram e os que não alcançaram, entre o salvador e o pecador, é negar o amor. O explorador, que é por sua vez explorado, encontra um paraíso nesta escuridão e ilusão. A separação entre Deus ou a realidade e vós é criada por vós mesmos, pela mente que se agarra ao conhecido, à certeza, à segurança. Esta separação não pode ser anulada; não há nenhum ritual, nenhuma disciplina, nenhum sacrifício que possa fazer a ponte; não existe nenhum salvador, nenhum mestre, nenhum guru que vos possa conduzir ao real ou que possa destruir esta separação. A divisão não é entre o real e vós; ela está dentro de vós mesmos. O essencial é que compreendam o conflito crescente do desejo; e esta compreensão só vem através do autoconhecimento e da constante atenção aos movimentos do eu.'
    ],
  ),
  Reflection(
    id: '36',
    title: 'Para Além de Toda a Experiência',
    day: 5,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A compreensão do eu requer uma grande dose de inteligência, uma grande dose de observação, de atenção, observando ininterruptamente, de modo a que ela não desapareça. Eu, que sou muito sério, quero dissolver o eu. Quando digo isso, sei que é possível dissolver o eu. Por favor, tenham paciência. No momento em que digo: "Quero dissolver isto", e no processo que sigo para que essa dissolução aconteça, há o experimentar do eu; e assim o eu é reforçado. Portanto, de que forma é possível ao eu não experimentar? Podemos observar que a criação não é de todo a experiência do eu. A criação acontece quando o eu está ausente, porque a criação não é intelectual, não provém da mente, não é uma projeção do eu, é algo que está para além de toda a experiência, tal como a conhecemos. Será possível para a mente ficar quieta, num estado em que não está a reconhecer, o que significa não estar a experimentar, estar num estado no qual a criação pode acontecer, ou seja, quando o eu não está lá, quando o eu está ausente? Estou a ser claro ou não? O problema é este, não é verdade? Qualquer movimento da mente, positivo ou negativo, constitui uma experiência que na realidade fortalece o "eu". Será possível para a mente não reconhecer? Isso só pode acontecer quando há um silêncio total, mas não o silêncio que é uma experiência do eu, e que como tal, reforça o eu.'
    ],
  ),
  Reflection(
    id: '37',
    title: 'O que É o Eu?',
    day: 6,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.virASer,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A procura de poder, posição, autoridade, ambição e todo o resto, são as formas do eu em todas as suas diferentes manifestações. Mas o que é importante, é compreender o eu, e tenho a certeza de que tanto vós como eu estamos convencidos disso. Se me permitem acrescentar, sejamos sérios acerca deste assunto; porque eu sinto que se vocês e eu, enquanto indivíduos, - não como um grupo de pessoas pertencentes a determinadas classes, a determinadas sociedades, a determinadas divisões climáticas -, podemos compreender isto e agir sobre isto, então penso que acontecerá uma verdadeira revolução. No momento em que se torna universal e com uma melhor organização, o eu relugia-se nisso; ao passo que se vocês e eu, enquanto indivíduos, pudermos amar, pudermos realmente levar isto a cabo no nosso cotidiano, então essa revolução que é tão essencial poderá ter lugar. Sabem a que me refiro quando utilizo o termo "eu"? Refiro-me a ideia, à memória, à conclusão, à experiência, às diversas formas de intenções nomeáveis e inomináveis, ao empenho consciente para ser ou para não ser. À memória acumulada do inconsciente, da raça, do grupo, do indivíduo, do clã e do conjunto de tudo isso, quer se projete exteriormente por meio da ação, ou espiritualmente sob a forma de virtude; o esforço por obter tudo isto é o eu. Nele está incluída a competição, o desejo de ser. A totalidade desse processo é o eu, e na verdade nós sabemos, quando somos confrontados com isso, que é algo mau. Estou a usar a palavra mau intencionalmente, porque o eu divide; o eu fecha-se em si mesmo; as suas atividades, por mais nobres que sejam, estão separadas e isoladas. Sabemos tudo isto. Sabemos igualmente que extraordinários são os momentos em que o eu não está presente, nos quais não existe a sensação de empenho, de esforço, e que acontecem quando há amor.'
    ],
  ),
  Reflection(
    id: '38',
    title: 'Quando Há Amor, Não Há Eu',
    day: 7,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A realidade, a verdade, não pode ser reconhecida. Para que a verdade surja, a crença, o conhecimento, a experiência, a virtude, a procura da virtude, que é diferente de ser-se virtuoso, tudo isto tem de desaparecer. A pessoa virtuosa que está consciente de procurar a virtude, nunca poderá encontrar a realidade. Pode ser uma pessoa muito decente; mas isso é inteiramente diferente do homem de verdade, do homem que compreende. Para o homem de verdade, a verdade ganhou existência. Um homem virtuoso é um homem correto, e um homem correto nunca pode compreender o que é a verdade; porque para ele a virtude é a cobertura do eu, o reforço do eu; porque ele procura a virtude. Quando ele diz: "Não devo ser ganancioso", o estado no qual ele não é ganan­cioso, e que ele experimenta, fortalece o eu. É por isso que é tão importante ser-se pobre, não apenas no que se refere às coisas mundanas, mas também no que diz respeito à crença e ao conhecimento. Um homem abastado em riquezas mundanas, ou um homem rico em conhecimento e crença, nunca conhecerão outra coisa que não a escuridão, e serão o centro de toda a maldade e miséria. Mas se vocês e eu, enquanto indivíduos, conseguirmos ver toda esta atividade do eu, então saberemos o que é o amor. Posso assegurar-vos de que essa é a única reforma que poderá mudar o mundo. O amor não é o eu. O eu não pode reconhecer o amor. Vocês dizem "amo", mas então, no próprio ato de o dizerem, no próprio ato de o experimentarem, não há amor. Mas, quando vocês conhecem o amor, não há eu. Quando há amor, não há eu.'
    ],
  ),
  Reflection(
    id: '39',
    title: 'Compreender O Que É',
    day: 8,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Certamente, um homem que compreende a vida não quer ter crenças. Um homem que ama não tem crenças, ama. É o homem que está consumido pelo intelecto que tem crenças, porque o intelecto está sempre em busca de segurança, de proteção; está constantemente a evitar o perigo, e portanto constrói ideias, crenças, ideais, nos quais procura refúgio. O que aconteceria se vocês lidassem diretamente com a violência agora? Seriam um perigo para a sociedade; e como a mente antevê o perigo, ela diz "alcançarei o ideal da não-violência daqui a dez anos", o que é um processo tão fictício e falso. Compreender "o que é", é mais importante do que criar e seguir ideais, porque os ideais são falsos, e "o que é" é o real. Compreender "o que é" requer uma enorme capaci­dade, uma mente ágil e sem preconceitos. É porque não queremos encarar e compreender "o que é", que inventamos as muitas formas de fugir e damos-lhes nomes adoráveis como ideal, crença, Deus. Por certo que é somente quando vejo o falso como falso, que a minha mente se torna capaz de ver o que é verdadeiro. Uma mente que está confundida pelo falso nunca pode descobrir a verdade. Portanto, devo compreender o que é falso nos meus relacionamentos, nas minhas ideias, nas coisas que me dizem respeito, porque perceber a verdade requer a compreensão do falso. Sem se removerem as causas da ignorância, não pode haver iluminação; e procurar a iluminação quando a mente não está iluminada é totalmente vazio, sem sentido. Por isso, devo começar a ver o falso na minha relação com as ideias, com as pessoas, com as coisas. Quando a mente vê aquilo que é falso, então o que é verdadeiro ganha existência e então há êxtase, há felicidade.'
    ],
  ),
  Reflection(
    id: '40',
    title: 'Aquilo em que Acreditamos',
    day: 9,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Será que a crença traz entusiasmo? Será que o entusiasmo se pode sustentar a si mesmo se não houver uma crença, e será o entusiasmo de todo necessário, ou o que é necessário é um outro tipo de energia, um outro tipo de vitalidade, de atividade? A maioria de nós entusiasma-se com uma coisa ou outra. Somos muito interessados, muito entusiásticos quando se trata de concertos, de exercício físico ou de ir fazer um piquenique. Todavia, a menos que esses entusiasmos sejam constantemente alimentados por uma coisa ou outra, eles acabam por esmorecer, e passamos a ter um novo entusiasmo por outras coisas. Haverá uma força que se sustente a si mesma, uma energia, que não dependa de uma crença? A outra questão é: será que necessitamos de qualquer espécie de crença, e se necessitamos, por que razão isso acontece? Este é um dos problemas relacionados com a questão. Nós não precisamos de acreditar que o sol, as montanhas e os rios existem. Não precisamos de acreditar que discutimos com as nossas mulheres. Não precisamos de acreditar que a vida é um grande sofrimento com as suas angústias, conflitos e constante ambição; é um fato. Mas exigimos uma crença quando queremos fugir de um fato em direção a uma irrealidade.'
    ],
  ),
  Reflection(
    id: '41',
    title: 'Conturbados pela Crença',
    day: 10,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A vossa religião, a vossa crença em Deus, é uma fuga ao real, o portanto não é religião nenhuma. O homem rico que acumula dinheiro por meio da crueldade, da desonestidade, da exploração astuciosa, acredita em Deus; e vocês também acreditam em Deus, também são astuciosos, cruéis, desconfiados, invejosos. Será possível encontrar Deus através da desonestidade, do logro, dos truques astuciosos da mente? Será que o fato de vocês colecionarem todos os livros sagrados e os vários símbolos de Deus significa que são pessoas religiosas? Assim, a religião não é a fuga ao fato; a religião é a compreensão do fato, daquilo que vocês são nos vossos relacionamentos cotidianos; a religião é o modo como falam, como dizem as coisas, como se dirigem aos vossos empregados, como tratam a vossa mulher, os vossos filhos, os vossos vizinhos. Enquanto não compreenderem a vossa relação com o vosso vizinho, com a sociedade, com a vossa mulher e os vossos filhos, haverá sempre confusão; e faça o que fizer, a mente que está confusa apenas será capaz de criar mais confusão, mais problemas e mais conflito. Uma mente que foge do real, dos fatos do relacionamento, nunca encontrará Deus; uma mente que está conturbada pelas crenças não conhecerá a verdade. Mas a mente que compreende a sua relação com a propriedade, com as pessoas, com as ideias, a mente que já não se debate com os problemas inerentes ao relacionamento, e para a qual a solução não é o afastamento mas a compreensão do amor, essa mente, e apenas ela, pode compreender a realidade.'
    ],
  ),
  Reflection(
    id: '42',
    title: 'Para Além da Crença',
    day: 11,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Constatamos que a vida é feia, dolorosa, triste; queremos algum tipo de teoria, algum tipo de especulação ou satisfação, algum tipo de doutrina que explique tudo isto, e portanto ficamos enredados na explicação, nas palavras, nas teorias, e gradualmente, as crenças vão adquirindo raízes profundas e inabaláveis, porque por detrás dessas crenças, por detrás desses dogmas, existe um medo permanente do desconhecido. Mas nós nunca olhamos para esse medo; desviamo-nos dele. Quanto mais fortes forem as crenças, mais fortes serão os dogmas. E quando examinamos estas crenças — cristãs, hindus, budistas — descobrimos que elas dividem as pessoas. Cada dogma, cada crença tem uma série de rituais, uma série de compulsões que prendem e separam os homens. Portanto, começamos com uma investigação para descobrirmos o que é verdadeiro, para descobrirmos qual é o significado deste sofrimento, desta luta, desta dor; e rapidamente nos tornamos prisioneiros de crenças, de rituais, de teorias. A crença é corrupção, porque por detrás dela e da moralidade esconde-se a mente, o eu, o eu a tornar-se maior, mais forte e poderoso. Nós consideramos a crença em Deus, a crença em algo como sendo a religião. Consideramos que acreditar é ser-se religioso. Compreendem? Se não acreditarem, serão considerados ateus, serão condenados pela sociedade. Uma sociedade condenará aqueles que acreditam em Deus, e outra condenará os que não acreditam. São ambas iguais. Portanto a religião torna-se uma questão de crença, e a crença atua sobre a mente e influencia-a; a mente, neste caso, nunca pode ser livre. Mas é somente na liberdade que vocês podem descobrir o que é verdadeiro, o que é Deus, não através de qualquer crença, porque a vossa própria crença projeta o que vocês pensam que Deus deve ser, o que vocês pensam que deve ser o verdadeiro.'
    ],
  ),
  Reflection(
    id: '43',
    title: 'O Véu da Crença',
    day: 12,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Vocês acreditam em Deus, e outra pessoa não acredita em Deus, e assim as vossas crenças separam-vos uns dos outros. A crença encontra-se organizada, pelo mundo a fora, sob a forma de Hinduísmo, Budismo ou Cristianismo, e deste modo divide um homem do outro. Estamos confusos e achamos que através da crença iremos tornar claro o que é confuso; isto é, a crença é sobreposta à confusão, e nós esperamos que com isso a confusão seja dissipada. Mas a crença é uma mera fuga, ao fato que é a confusão, ela não nos ajuda a encarar nem a compreender o fato, mas apenas a fugirmos da confusão em que nos encontramos. Para compreendermos a confusão não é necessária a crença, e a crença apenas atua como um véu entre nós e os nossos problemas. Assim, a religião, que é a crença organizada, torna-se um meio de fuga "ao que é", ao fato que é a confusão. O homem que acredita em Deus, o homem que acredita no além, ou que tem qualquer outra forma de crença, está a fugir à realidade do que ele próprio é. Não conhecem aqueles que acreditam em Deus, que fazem puja, que repetem certos cânticos e mantras, e que nas suas vidas diárias são dominadores, cruéis, ambiciosos, batoteiros, desonestos? Poderão encontrar Deus? Estão realmente à procura de Deus? Será possível encontrar Deus através da repetição de palavras, através da crença? Mas essas pessoas acreditam em Deus, adoram a Deus, vão todos os dias ao templo, fazem de tudo para fugirem ao fato que é a realidade do que são. E vocês consideram-nas respeitáveis porque elas são vocês mesmos.'
    ],
  ),
  Reflection(
    id: '44',
    title: 'Uma Nova Aproximação à Vida',
    day: 13,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Parece-me que uma das coisas que a maioria de nós aceita de bom grado e toma como garantido é a questão das crenças. Não estou a atacar as crenças. O que estamos a tentar fazer é descobrir por que razão aceitamos as crenças; e se pudermos compreender os motivos, o que está na origem da aceitação, então talvez, possamos não só compreender por que o fazemos, mas também libertarmo-nos disso. Podemos observar de que modo as crenças políticas e religiosas, nacionalistas e de muitos outros tipos, separam as pessoas, criam realmente conflito, confusão e antagonismo, o que é um fato óbvio; e ainda assim não temos vontade de nos libertar delas. Existe a crença hindu, a crença cristã, a crença budista, inúmeras crenças sectárias e nacionalistas, diversas ideologias políticas, degladiando-se todas umas às outras, tentando converter-se umas às outras. Podemos observar, como é óbvio, que a crença está a separar as pessoas, a criar intolerância; será possível viver sem crença? Só o poderemos descobrir se nós conseguirmos estudar a nós mesmos na nossa relação com uma crença. Será possível viver neste mundo sem ter uma crença, não mudando de crenças, não substituindo uma crença por outra, mas estar completamente livre de todas as crenças, de forma a que possamos ter uma nova aproximação à vida a cada minuto? Isto é, afinal, a verdade: ter a capacidade de encarar tudo de uma nova forma, de momento a momento, sem a reação condicionante do passado, de modo a que não haja o efeito cumulativo que funciona como uma barreira entre nós mesmos e "o que é".'
    ],
  ),
  Reflection(
    id: '45',
    title: 'A Crença Impede a Compreensão Verdadeira',
    day: 14,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Se não tivéssemos qualquer crença, o que é que nos sucederia? Não deveríamos ficar muito assustados com o que pudesse acontecer? Se não tivéssemos qualquer padrão de ação baseado numa crença, quer fosse em Deus, ou no comunismo, ou no imperialismo, ou nalgum tipo de fórmula religiosa, algum dogma no qual estamos condicionados, sentir-nos-íamos totalmente perdidos, não era? E não é esta aceitação da crença o disfarce desse medo, do medo de no fundo não sermos nada, de sermos vazios? Afinal, uma chávena apenas tem utilidade se estiver vazia; e uma mente que está cheia de crenças, de dogmas, de certezas, de citações, é na verdade uma mente incapaz de criar; é tão-somente uma mente repetitiva. Para escaparmos desse medo, desse medo do vazio, desse medo da solidão, desse medo da estagnação, de não se chegar, de não se conseguir, de não se alcançar, de não se ser alguma coisa, de não se vir a ser alguma coisa, é certamente uma das razões, não é verdade, por que aceitamos as crenças tão rápida e avidamente? E, através da aceitação da crença, será que nos compreendemos a nós mesmos? Pelo contrário. Uma crença, religiosa ou política, impede, obviamente, a compreensão de nós mesmos. Atua como um véu através do qual olhamos para nós próprios. E poderemos olhar para nós próprios sem as crenças? Se removermos estas crenças, as muitas crenças que temos, sobrará alguma coisa para a qual olharmos? Se não tivermos nenhumas das crenças com as quais a mente se tenha identificado, então a mente, sem identificação, torna-se capaz de se ver a si mesma tal qual é, e então, tem por certo início a compreensão de nós mesmos.'
    ],
  ),
  Reflection(
    id: '46',
    title: 'Observação Direta',
    day: 15,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.crenca,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Por que criam as ideias raízes na nossa mente? Por que não se tornam os fatos o mais importante, e não as ideias? Por que é que as teorias, as ideias, se tornam tão importantes em vez dos fatos? Será que não conseguimos compreender o fato, ou que não temos a capacidade, ou que tememos encarar o fato? Portanto, as ideias, as especulações, as teorias são um meio de fugir do fato. Podem fugir, podem fazer todo o tipo de coisas; os fatos permanecem lá, o fato de estarmos zangados, o fato de sermos ambiciosos, o fato de sermos seres sexuais, milhentas coisas. Podem reprimi-los, podem transmutá-los, o que é uma outra forma de repressão; podem controlá-los, mas eles estarão todos a ser reprimidos, controlados e disciplinados por meio de ideias. Não é verdade que as ideias nos fazem perder a nossa energia? Não é verdade que as ideias embotam a mente? Podemos ser inteligentes quando especulamos, quando citamos alguém; mas, como é óbvio, é uma mente embotada que cita, que leu muito, e cita. Acabarão com o conflito dos opostos de uma só vez se forem capazes de viver com o fato, e com isso libertarem a energia necessária para encararem o fato. Para a maior parte de nós, a contradição é um campo extraordinário no qual a mente se encontra aprisionada. Quero fazer determinada coisa, e acabo por fazer algo completamente diferente; mas se eu encarar o fato de querer fazer determinada coisa, deixa de haver contradição; e assim, de uma só vez, abulo por completo todo o significado da oposição, e então a minha mente fica inteiramente atenta "ao que é", e com a compreensão "do que é".'
    ],
  ),
  Reflection(
    id: '47',
    title: 'Ação sem Ideia',
    day: 16,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'É somente quando a mente se encontra livre da ideia que pode haver experimentação. As ideias não são a verdade; e a verdade é algo que deve ser experimentado de forma direta, de momento a momento. Não se trata de uma experiência que seja desejada por vós, o que seria mera sensação. E apenas quando conseguimos ir além do feixe de ideias, que constitui o "eu", que constitui a mente, que tem uma continuidade parcial ou completa, só quando conseguimos ir para além disso, quando o pensamento se encontra completamente silencioso, é que existe um estado que permite a experimentação. Então saberemos o que é a verdade.'
    ],
  ),
  Reflection(
    id: '48',
    title: 'Ação sem o Processo do Pensamento',
    day: 17,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O que entendemos por ideia? Certamente a ideia é o processo do pensamento. Não é verdade? A ideia é um processo da atividade mental, da atividade do pensamento; e a atividade do pensamento é sempre uma reação, ou do consciente ou do inconsciente. Pensar é um processo de verbalização, o qual resulta da memória; pensar é um processo do tempo. Portanto, quando a ação se baseia no processo do pensamento, uma tal ação deve, inevitavelmente, ser condicionada, isolada. Uma ideia deve opor-se a outra ideia, uma ideia deve ser dominada por outra ideia. Então verifica-se uma lacuna entre a ação e a ideia. O que nós estamos a tentar descobrir é se a ação pode existir sem a ideia. Podemos observar o quanto a ideia separa as pessoas. Tal como já vos expliquei, o conhecimento e a crença são, na sua essência, qualidades que separam. As crenças nunca unem as pessoas; elas separam sempre as pessoas; quando a ação se baseia na crença, ou numa ideia, ou num ideal, torna-se inevitável que ela seja isolada, fragmentada. É possível agir sem o processo do pensamento, sendo o pensamento um processo do tempo, um processo de cálculo, um processo de autoproteção, um processo de crença, negação, condenação, justificação. Certamente vos deve ter ocorrido, como me ocorreu a mim, se poderá ser possível haver ação sem a ideia.'
    ],
  ),
  Reflection(
    id: '49',
    title: 'As Ideias Limitam a Ação?',
    day: 18,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Poderão as ideias alguma vez produzir ação, ou será que elas apenas moldam o pensamento e limitam, consequentemente, a ação? Quando a ação é impulsionada por uma ideia, ela nunca pode libertar o homem. É extraordinariamente importante para nós que compreendamos este ponto. Se uma ideia der forma à ação, então a ação nunca poderá trazer a solução para os nossos sofrimentos, porque, antes que ela possa ser posta em ação, temos de descobrir primeiro como é que surge a ideia.'
    ],
  ),
  Reflection(
    id: '50',
    title: 'A Ideologia Evita a Ação',
    day: 19,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O mundo está permanentemente à beira da catástrofe. Mas parece que atualmente se encontra ainda mais próximo dela. Ao nos apercebermos desta catástrofe iminente, muitos de nós refugiam-se na ideia. Nós pensamos que esta catástrofe, esta crise, pode ser resolvida através de uma ideologia. A ideologia é sempre um impedimento ao relacionamento direto, e isto não permite a ação. Nós desejamos a paz apenas como uma ideia, mas não como uma realidade. Queremos a paz somente ao nível verbal, o qual se encontra exclusivamente ao nível do pensamento, embora seja com orgulho que lhe chamamos o nível intelectual. Mas a palavra paz não é a paz. A paz só pode existir quando cessar a confusão que se estabelece entre vós e o outro. Estamos apegados ao mundo das ideias e não à paz. Procuramos novos padrões sociais e políticos, não procuramos a paz; estamos preocupados com a reconciliação dos efeitos e não com a erradicação das causas da guerra. Esta procura apenas nos trará respostas condicionadas pelo passado. E a este condicionamento que chamamos conhecimento, experiência; e os fatos novos, em mudança, são traduzidos, interpretados, de acordo com este conhecimento. Portanto, existe conflito entre "o que é" e a experiência passada. O passado, que é conhecimento, estará sempre em conflito com o fato, que se situa sempre no presente. Assim, isto não irá resolver o problema, mas antes perpetuar as condições que criaram o problema.'
    ],
  ),
  Reflection(
    id: '51',
    title: 'Ação sem Ideação',
    day: 20,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A ideia é o resultado do processo do pensamento, o processo do pensamento é a resposta da memória, e a memória está sempre condicionada. A memória está sempre no passado, e essa memória ganha vida no presente por meio de um desafio. A memória não tem qualquer tipo de vida em si mesma; é-lhe dada vida no presente quando é confrontada por um desafio. E toda a memória, latente ou ativa, é condicionada, não é verdade?  Assim sendo, tem de haver uma aproximação totalmente diferente. Têm de descobrir por vós mesmos, interiormente, se estão a agir sobre uma ideia, e se poderá existir ação sem ideação.'
    ],
  ),
  Reflection(
    id: '52',
    title: 'Agir sem Ideia É o Caminho do Amor',
    day: 21,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.acao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O pensamento está sempre limitado pelo pensador, que está condicionado; o pensador está sempre condicionado e nunca é livre; quando ocorre um pensamento, segue-se imediatamente uma ideia. A ideia como meio para a ação só poderá dar origem a mais confusão. Estando conscientes de tudo isto, será possível agir sem ideia? Sim, é o caminho do amor. O amor não é uma ideia; não é uma sensação; não é uma memória; não é um sentimento de adiamento, um dispositivo de auloproteção. Só podemos estar despertos para o caminho do amor quando compreendemos todo o processo da ideia. Agora, será possível abandonar os outros caminhos e conhecer o caminho do amor, que é a única redenção que existe? Nenhum outro caminho, político ou religioso, irá resolver o problema. Não se trata de uma teoria sobre a qual terão de refletir para depois adotarem nas vossas vidas; deve ser real. Existe ideia quando amamos? Não o aceitem; observem-no, examinem-no, investiguem-no profundamente; porque nós já tentámos todos os outros caminhos, e não nos deram qualquer resposta para o sofrimento. Os políticos podem prometê-lo; as assim chamadas organizações religiosas podem prometer uma felicidade futura; mas não a temos no presente, e o futuro tem uma importância muito relativa quando estou faminto. Tentámos todos os outros caminhos; e só podemos conhecer o caminho do amor se conhecermos o caminho da ideia e abandonarmos a ideia, o que é agir.'
    ],
  ),
  Reflection(
    id: '53',
    title: 'O Conflito dos Opostos',
    day: 22,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Pergunto-me se existirá uma tal coisa a que se possa chamar o mal? Por favor, prestem atenção, acompanhem-me, vamos investigar juntos. Dizemos que existe o bem e o mal. Existe a inveja e o amor, e dizemos que a inveja é má e que o amor é bom. Por que razão dividimos a vida, chamando bom a isto e mau àquilo, criando desta forma o conflito entre os opostos? Não que a inveja, o ódio, a brutalidade não existam na mente e no coração humanos, uma ausência de compaixão, de amor, mas por que dividimos a vida entre a coisa a que chamamos bem e a coisa a que chamamos mal? Não existirá, na verdade, apenas uma única coisa, que é uma mente que não está atenta? Certamente, quando há uma atenção total, isto é, quando a mente está completamente consciente, alerta, atenta, não existe uma tal coisa como mal ou bem; existe apenas um estado de consciência desperta. Então, a bondade não é uma qualidade, uma virtude, e um estado de amor. Quando existe amor, não há bem nem mal, há apenas amor. Quando vocês amam verdadeiramente alguém, não pensam em termos de bem ou de mal, todo o vosso ser está repleto desse amor. E somente quando cessa a atenção completa, quando cessa o amor, que surge o conflito entre o que sou e o que deveria ser. Então, aquilo que sou é o mal e aquilo que deveria ser é o assim chamado bem. Observem a vossa mente e verão que no momento em que a mente pára de pensar em termos de vir a ser algo diferente do que é, dá-se um terminar da ação que não é estagnação; é um estado de atenção total, que é bondade.'
    ],
  ),
  Reflection(
    id: '54',
    title: 'Para Além da Dualidade',
    day: 23,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não estão conscientes dela? Não são as suas ações óbvias, a sua tristeza esmagadora? Quem a criou senão cada um de nós? Quem é responsável por ela senão cada um de nós? Do mesmo modo que criámos o bem, por pouco que seja, também criamos o mal, por mais vasto que seja. O bem e o mal são parte de nós e são também independentes de nós. Quando somos mesquinhos no que pensamos-sentimos, invejosos, com ganância e ódio, estamos a aumentar o mal que nos dilacera. Este problema do bem e do mal, este problema conflituoso, está sempre conosco à medida que o vamos criando. Tornou-se parte de nós mesmos, este querer e não querer, amar e odiar, desejar e renunciar. Estamos continuamente a criar esta dualidade na qual o pensamento-sentimento é apanhado. O pensamento-sentimento pode ir além e acima do bem e do seu oposto somente quando compreende a sua causa, o desejo. Ao compreendermos o mérito e o demérito, libertamo-nos de ambos. Os opostos não se podem fundir e deverão ser transcendidos através da dissolução do desejo. Cada oposto deve ser bem estudado, atentamente sentido, tão vasta e profundamente quanto possível, através de todas as camadas da consciência. A partir deste pensar e deste sentir profundos, uma nova compreensão é despertada, a qual não é produto do desejo ou do tempo. Existe mal no mundo e nós estamos a contribuir para ele, da mesma forma que contribuímos para o bem. Parece que o homem se une mais facilmente no ódio do que no bem. Um homem sábio compreende a causa do bem e do mal, e através da compreensão, liberta o pensamento-sentimento dela.'
    ],
  ),
  Reflection(
    id: '55',
    title: 'Justificar o Mal',
    day: 24,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'É óbvio que a presente crise que grassa por todo o mundo tem um carácter excepcional, sem precedentes. Tem havido crises de diversos tipos em períodos diferentes da história, sociais, nacionais, políticas. As crises vêm e vão; recessões econômicas, depressões, chegam, são modificadas, e continuam sob uma outra forma. Sabemos isso; estamos familiarizados com esse processo. Mas a presente crise é certamente diferente, não é? É diferente, porque, em primeiro lugar, estamos a lidar não com dinheiro nem com coisas tangíveis, mas com ideias. Esta crise é excepcional porque se situa no campo da ideação. Estamos a guerrear com ideias, estamos a justificar o assassínio; em toda a parte do mundo estamos a justificar o assassínio como meio para se atingir um fim que é correto, o que é, em si próprio, algo que nunca havia acontecido anteriormente. No passado, o mal era reconhecido como mal, o assassinato era reconhecido como tal, mas agora o assassinato é um meio de se atingir um resultado nobre. O assassínio, seja de uma única pessoa ou de um grupo de pessoas, é justificado, porque o assassino, ou o grupo que o assassino representa, o justifica como um meio de alcançar um resultado que será benéfico para a humanidade. Ou seja, sacrificamos o presente em nome do futuro, e não importa quais os meios que empregamos desde que o nosso propósito expresso seja o de produzir um resultado que dizemos trazer benefícios à humanidade. Portanto, o que está implícito é que um meio errado pode produzir um fim correto, e justificamos os meios errados através da ideação. Dispomos de uma magnífica estrutura de ideias para justificarmos o mal e isso é certamente algo sem precedentes. O mal é mal; não pode dar origem a algo bom. A guerra não é um meio para se alcançar a paz.'
    ],
  ),
  Reflection(
    id: '56',
    title: 'A Bondade Não Tem Motivo',
    day: 25,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Se eu tiver um motivo para ser bom, será que isso faz nascer a bondade? Ou será a bondade algo que é completamente desprovido desta ânsia de ser bom, que está sempre baseada num motivo? Será o bem o oposto do mau, o oposto do mal? Cada oposto contém em si a semente do seu próprio oposto, não é assim? Existe a ganância, e existe o ideal da não-ganância. Quando a mente procura a não-ganância, quando ela tenta deixar de ser gananciosa, está a continuar a sê-lo, porque está a querer ser algo. A ganância implica desejar, adquirir, expandir; e quando a mente vê que ser gananciosa não compensa, começa a desejar deixar de ser gananciosa, portanto o motivo continua a ser o mesmo, o de ser ou de adquirir algo. Quando a mente quer deixar de querer, a raiz do querer, do desejo, ainda permanece lá. Portanto a bondade não é o oposto do mal; é um estado totalmente diferente. E o que é esse estado? É óbvio que a bondade não tem motivo, porque todo o motivo tem a sua base no eu; é o movimento egocêntrico da mente. Portanto, o que queremos dizer quando falamos de bondade? Certamente só existe bondade quando há uma atenção total. A atenção não tem motivo. Quando existe um motivo para a atenção, haverá realmente atenção? Se presto atenção, porque quero adquirir algo, a aquisição, seja ela boa ou má, não é atenção, é uma distração. Uma divisão. Só existe bondade quando há uma totalidade de atenção na qual não se verifica nenhum esforço para ser ou para não ser.'
    ],
  ),
  Reflection(
    id: '57',
    title: 'Evolução Humana',
    day: 26,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Será necessário conhecermos a embriaguês para que possamos conhecer a sobriedade? Será necessário que vocês conheçam o ódio para que possam saber o que significa ser-se compassivo? Será que precisam de passar por guerras, pela vossa destruição e a dos outros, para saberem o que é a paz? Esta é certamente uma forma de pensar completamente errada, não é assim? Primeiro acreditam que existe evolução, crescimento, um movimento que vai do mau para o bom, e depois deixam que a vossa forma de pensar adote este padrão. É óbvio que existe um crescimento físico, a pequena planta que se transforma numa grande árvore; há progresso tecnológico, a roda que evoluiu ao longo de séculos e que chegou ao avião a jato. Mas será que há um progresso psicológico, uma evolução? É isso que estamos a discutir, se haverá um crescimento, uma evolução do "eu", que começa com o mal e termina com o bem. Poderá o "eu", que é o centro do mal, através de um processo de evolução, através do tempo, vir alguma vez a tornar-se nobre, bom? É óbvio que não. Aquilo que é mau, o "eu" psicológico, permanecerá sempre mau. Mas nós não o queremos encarar. Pensamos que através do processo do tempo, através do crescimento e da mudança, o "eu" tornar-se-á enfim realidade. É esta a nossa esperança, o nosso anseio, que o "eu" se irá aperfeiçoar com o tempo. O que é este "eu"? É um nome, uma forma, um feixe de memórias, esperanças, frustrações, desejos, dores, tristezas, alegrias passageiras. Nós queremos que este "eu" continue e se torne perfeito, e portanto dizemos que para além do "eu" existe um "super-eu", um eu mais elevado, uma entidade espiritual que é intemporal, mas uma vez que podemos pensar nela, essa entidade "espiritual" pertence ainda ao campo do tempo, não é? Se podemos pensar nela, isso significa que ela se encontra, como é óbvio, dentro do campo da nossa razão.'
    ],
  ),
  Reflection(
    id: '58',
    title: 'Liberdade em relação à Ocupação',
    day: 27,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Poderá a mente ficar livre do passado, livre do pensamento, não do bom ou mau pensamento? Como posso descobrir isso? Só o posso descobrir se observar aquilo de que a mente se ocupa. Se a minha mente está ocupada com o bom ou com o mau, então está apenas preocupada com o passado, está ocupada com o passado. Portanto, o importante é descobrir com o que é que a mente se ocupa. Sempre que a mente está ocupada, está ocupada com o passado, porque toda a nossa consciência é passado. O passado não se encontra apenas à superfície, mas ao mais alto nível, e a pressão sobre o inconsciente é também o passado. Poderá a mente ficar livre da ocupação? Ou seja, poderá a mente estar completamente desocupada, e deixar a memória, os pensamentos bons ou maus, fluírem sem escolha? Sempre que a mente está ocupada com um pensamento, bom ou mau, está ocupada com o passado. Se ouvirem com atenção, não apenas verbalmente, mas muito profundamente, então poderão ver que existe uma estabilidade que não vem da mente, que é a libertação do passado. E no entanto, o passado nunca pode ser posto de lado. Há um observar do passado à medida que ele vai correndo, mas não uma ocupação com ele. Assim, a mente está livre para observar e para não escolher. Onde houver escolha neste movimento do rio da memória, haverá ocupação; e a partir do momento que a mente se encontra ocupada, fica aprisionada no passado; e quando a mente está ocupada com o passado, torna-se incapaz de ver algo real, verdadeiro, novo, original, incontaminado.'
    ],
  ),
  Reflection(
    id: '59',
    title: 'O Pensar Gera Esforço',
    day: 28,
    month: Months.fevereiro,
    monthFilters: ['fev'],
    tag: Tags.bemEMal,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Como posso permanecer livre de pensamentos maus, de pensamentos maus e caprichosos? Existirá o pensador, aquele que está separado do pensamento, separado dos pensamentos maus e caprichosos? Por favor, observem as vossas próprias mentes.  Dizemos: Existe o eu que diz “Este pensamento é caprichoso”, “Isto é mau”, “Tenho de controlar este pensamento”, “Tenho de me ater a este pensamento”. Isto é o que conhecemos. Será que esse alguém, o eu, o pensador, o juiz, aquele que julga, que censura, diferente de tudo isto? Será o eu diferente do pensamento, diferente da inveja, diferente do mal? O eu que diz que é diferente deste mal está perpetuamente a tentar superar-me, empurrar-me para longe, a tentar tornar-se algo. Portanto vocês têm esta luta, o esforço para afastar certos pensamentos, para não se ser caprichoso. Fomos nós que criámos, através do próprio processo do pensamento, este problema do esforço. Estão a acompanhar o que digo? Então vocês deram origem à disciplina, ao controlo do pensamento, o eu a controlar os pensamentos que não são bons, o eu que está a tentar não ser invejoso, violento, que está a tentar ser isto e ser aquilo. Assim, deram origem ao próprio processo do esforço quando existe o eu e algo que ele está a controlar. Esta é a realidade da nossa existência cotidiana.'
    ],
  ),
  Reflection(
    id: '60',
    title: 'Uma Mente Livre É Humilde',
    day: 1,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.dependencia,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Alguma vez se debruçaram sobre a questão da dependência psicológica? Se a observarem muito profundamente, descobrirão que a maior parte de nós se encontra terrivelmente só. A maioria de nós tem uma mente muito superficial e vazia. A maioria de nós não sabe o que é o amor. Assim, devido a essa solidão, devido a essa insuficiência, à privação da vida, apegamo-nos a algo, apegamo-nos à família; dependemos dela. E quando a mulher ou o marido desviam de nós a sua atenção, ficamos enciumados. O ciúme não é amor; mas o amor que a sociedade atribui à família está investido de respeitabilidade. Essa é outra forma de defesa, outra forma de fugirmos de nós mesmos. Portanto, qualquer forma de resistência alimenta a dependência. E uma mente que é dependente nunca poderá ser livre. Vocês precisam de ser livres, porque assim poderão observar que uma mente que é livre contém a essência da humildade. Uma tal mente, que é livre e, portanto, humilde, pode aprender, o que não acontece com uma mente que tem resistências. Aprender é uma coisa extraordinária, aprender, não acumular conhecimento. Acumular conhecimento é algo completamente diferente. Aquilo a que chamamos conhecimento é relativamente fácil, porque se inscreve no movimento que parte do conhecido para o conhecido. Mas aprender é um movimento que parte do conhecido para o desconhecido, só assim podem aprender, não é verdade?'
    ],
  ),
  Reflection(
    id: '61',
    title: 'Nunca Questionamos o Problema da Dependência',
    day: 2,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.dependencia,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Por que somos dependentes? Dependemos psicologicamente e interiormente de uma crença, de um sistema, de uma filosofia; pedimos a outros um modelo de conduta; procuramos guias que nos ensinem um modo de vida que nos proporcione alguma esperança, alguma felicidade. Portanto, estamos sempre à procura de algum tipo de dependência, de segurança, não é verdade? Será que a mente poderá alguma vez libertar-se deste sentido da dependência? Isto não significa que a mente deva alcançar a independência, isso é apenas a reação à dependência. Não estamos a falar de independência, da libertação relativamente a um determinado estado. Se pudermos investigar sem a reação da procura de libertação relativamente a um estado particular de dependência, então poderemos ir muito mais fundo na nossa investigação. Aceitamos a necessidade de dependência; dizemos que é inevitável. Nunca questionamos realmente este assunto a fundo, a razão de cada um de nós procurar algum tipo de dependência. Não é verdade que, lá bem no fundo, nós exigimos, de fato, segurança, permanência? Estando nós imersos num estado de confusão, queremos que alguém nos salve dessa mesma confusão. Assim, estamos sempre preocupados com a forma de escaparmos ou de evitarmos o estado no qual nos encontramos. No processo de evitarmos esse estado, torna-se inevitável que criemos algum tipo de dependência, a qual se transforma numa autoridade para nós. Se dependermos de outro para termos a nossa segurança, para o nosso bem-estar interior, surgem, dessa mesma dependência, inúmeros problemas, e então tentamos resolver esses problemas, os problemas do apego. Mas nunca questionamos, nunca investigamos profundamente o problema da dependência em si próprio. Talvez se nós conseguirmos investigar esta questão de um modo verdadeiramente inteligente, com uma total atenção, então talvez possamos descobrir que a dependência não é de todo o que está em causa, que ela é somente uma forma de fugirmos de um fato mais profundo.'
    ],
  ),
  Reflection(
    id: '62',
    title: 'Existe um Fato mais Profundo que nos Torna Dependentes',
    day: 3,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.dependencia,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Sabemos que somos dependentes, do nosso relacionamento com os outros, ou de alguma ideia, ou de algum sistema de pensamento. Porquê? Na verdade, não considero que a dependência seja o problema; penso que existe um fator mais profundo que nos torna dependentes. E, se formos capazes de esclarecer isso, então, tanto a dependência quanto a luta pela liberdade terão muito pouca importância; então, todos os problemas que surgem com a dependência se dissiparão. Portanto, qual é esse fator mais profundo? Será o fato de a mente detestar, temer, a ideia de estar só? E será que a mente conhece esse estado que tenta a todo o custo evitar? Enquanto essa solidão não for verdadeiramente compreendida, sentida, penetrada, dissolvida, qualquer que seja o termo que desejem empregar, enquanto esse sentimento de solidão perdurar, a dependência é inevitável, e nunca conseguiremos ser livres; nunca poderemos descobrir por nós mesmos aquilo que é verdadeiro, aquilo que é a religião.'
    ],
  ),
  Reflection(
    id: '63',
    title: 'Tornar-se Profundamente Desperto',
    day: 4,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A dependência desencadeia o movimento da indiferença e do apego, um conflito constante no qual não há nem compreensão nem libertação. Vocês devem tornar-se conscientes do processo do apego e da dependência, tornar-se conscientes dele sem condenação, sem julgamento, e então perceberão o significado deste conflito de opostos. Se conseguirem estar profundamente conscientes e dirigirem o pensamento no sentido da compreensão do que realmente significa a necessidade, a dependência, então a vossa mente consciente ficará aberta e clarificada relativamente a isto; e então, o subconsciente, com as suas motivações, buscas e intenções ocultas, projetar-se-á no consciente. Quando isto acontece, devem estudar e compreender cada sugestão do subconsciente. Se fizerem isto muitas vezes, tornando-se conscientes das projeções do subconsciente que têm lugar depois de o consciente ter resolvido o problema através do pensamento da forma mais clara possível, então, apesar de darem atenção a outros assuntos, o consciente e o subconsciente resolverão o problema da dependência, ou qualquer outro problema. Assim, fica estabelecida uma atenção constante que, de forma paciente e suave, dará origem à integração; e se a vossa saúde e a vossa alimentação estiverem corretas, isto vos trará, por sua vez, uma plenitude do ser.'
    ],
  ),
  Reflection(
    id: '64',
    title: 'Relacionamento',
    day: 5,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O relacionamento baseado na necessidade mútua só pode trazer conflito. Independentemente do quanto possamos ser interdependentes, nós estamos a usar-nos uns aos outros com um propósito, com um fim. Quando há um fim em vista, não há relacionamento. Vocês podem usar-me e eu posso usar-vos. Neste uso perdemos o contato. Uma sociedade haseada no uso mútuo constitui os alicerces da violência. Quando utilizamos outra pessoa, temos apenas a imagem do fim que temos em vista. O fim, o ganho, impede o relacionamento, a comunhão. Na utilização de outra pessoa, por mais gratificante e reconfortante que seja, está sempre presente o medo. Para evitarmos este medo, temos de possuir. A partir desta posse surgem a inveja, a desconfiança e o conflito constantes. Um tal relacionamento nunca poderá ser uma fonte de felicidade. Uma sociedade cuja estrutura se baseia na mera necessidade, fisiológica ou psicológica, tem forçosamente de alimentar o conflito, a confusão e a miséria. A sociedade é a projeção de vós mesmos no vosso relacionamento com o outro, no qual predominam a necessidade e a utilização. Quando fazem uso de outra pessoa para responderem ás nossas necessidades, físicas ou psicológicas, não estão, de fato, em relação com essa pessoa; não têm verdadeiramente qualquer contato com ela, nenhuma comunhão com ela. Como é possível estarem em comunhão com o outro quando ele está a ser utilizado como uma peça de mobiliário, para vossa conveniência e conforto? Portanto, é essencial compreender a importância do relacionamento na vida diária.'
    ],
  ),
  Reflection(
    id: '65',
    title: 'O "Eu" É a Posse',
    day: 6,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A renúncia, o auto-sacrifício, não é um gesto de grandeza que deva ser elogiado e seguido. Queremos possuir, porque sem a posse não existimos. As posses são muitas e variadas. Alguém que não tem posses materiais pode estar apegado ao conhecimento, às ideias; outro pode estar apegado à virtude, outro, à experiência, outro, ao nome e à fama, e assim por diante. Sem as posses, o "eu" não existe; o "eu" é a posse, a mobília, a virtude, o nome. Por causa deste medo do não ser, a mente está apegada ao nome, à mobília, ao valor; e abandoná-los-á por um nível mais elevado, sendo o mais elevado aquilo que é mais gratificante, mais permanente. O medo da incerteza, de não ser, produz o apego, a posse. Quando a posse não é satisfatória ou provoca dor, renunciamos a ela em troca de um apego mais prazeroso. A posse mais gratilicante é, em última instância, a palavra Deus, ou o seu substituto, o Estado. Enquanto não estiverem dispostos a ser nada, e de fato não estão, é inevitável que vocês alimentem a tristeza e o antagonismo. A vontade de ser nada não é uma questão de renúncia, de constrangimento, interior ou exterior, mas de se ver a verdade "do que é". Ver a verdade "do que é" liberta-nos do medo da insegurança, o medo que alimenta o apego e conduz à ilusão de desapego, de renúncia. O amor por "o que é" é o começo da sabedoria. Só o amor pode partilhar, só ele pode entrar em comunhão; mas a renúncia e o auto-sacrifício são os caminhos do isolamento e da ilusão.'
    ],
  ),
  Reflection(
    id: '66',
    title: 'Explorar É Ser-se Explorado',
    day: 7,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.dependencia,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Como a maioria de nós procura o poder sob uma forma ou outra, é assim estabelecido o princípio da hierarquia, o novato e o iniciado, o aluno e o Mestre, e até mesmo entre os mestres existem graus de crescimento espiritual. A maior parte de nós adora explorar e ser explorado, e o sistema em que vivemos oferece-nos todos os meios para tal, estejam eles ocultos ou à vista. Explorar é ser-se explorado. O desejo de fazermos uso dos outros para as nossas necessidades psicológicas abre caminho à dependência, e quando dependemos temos de agarrar, de possuir; e aquilo que possuímos possui-nos. Sem dependência, sutil ou grosseira, sem possuirmos coisas, pessoas e ideias, ficamos vazios, tornamo-nos algo sem importância. Queremos ser alguma coisa e, para evitarmos o medo corrosivo de não sermos nada, passamos a pertencer a esta ou àquela organização, a esta ou àquela ideologia, a esta igreja ou àquele templo; portanto somos explorados, e por nosso lado, também exploramos.'
    ],
  ),
  Reflection(
    id: '67',
    title: 'Cultivar o Desapego',
    day: 8,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Só existe apego; não existe uma tal coisa a que se possa chamar desapego. A mente inventa o desapego como reação à dor do apego. Quando vocês reagem ao apego tornando-se "desapegados", isso significa que estão apegados a qualquer outra coisa. Assim, todo esse processo é um processo de apego. Estão apegados à vossa mulher ou ao vosso marido, aos vossos filhos, a ideias, à tradição, à autoridade, e assim por diante; e a vossa reação a esse apego é o desapego. Cultivar o desapego é o resultado da tristeza, da dor. Querem fugir da dor do apego, e a vossa fuga é encontrarem algo a que pensam que se podem apegar. Portanto, existe apenas o apego. E é uma mente estúpida que cultiva o desapego. Todos os livros dizem: "Sejam desapegados", mas qual é a verdade disto? Se observarem a vossa própria mente, poderão ver uma coisa extraordinária, que ao cultivar o desapego, a vossa mente se está a tornar apegada a uma outra coisa.'
    ],
  ),
  Reflection(
    id: '68',
    title: 'O Apego é Auto-Ilusão',
    day: 9,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Somos as coisas que possuímos, somos aquilo a que estamos apegados. O apego não tem qualquer nobreza. O apego ao conhecimento não é em nada diferente de qualquer outra dependência gratificante. O apego é estar absorto sobre si mesmo, quer seja ao nível mais baixo ou mais elevado. O apego é auto-ilusão, é uma fuga ao vazio do eu. As coisas às quais estamos apegados, bens, pessoas, ideias, tornam-se o mais importante, pois sem as muitas coisas que preenchem o seu vazio, o eu não tem existência. E o medo de não existir que dá origem à posse; e o medo alimenta a ilusão, a sujeição às conclusões. As conclusões, materiais ou ideológicas, impedem a fruição da inteligência, da liberdade na qual, e única e exclusivamente nela, a realidade pode passar a existir; e sem esta liberdade, a astúcia é tomada por inteligência. Os caminhos da astúcia são sempre complexos e destrutivos. É esta astúcia autoprotetora que origina o apego; e quando o apego causa dor, é esta mesma astúcia que busca o desapego e encontra prazer no orgulho e na vaidade da renúncia. A compreensão dos caminhos da astúcia, dos caminhos do eu, é o princípio da inteligência.'
    ],
  ),
  Reflection(
    id: '69',
    title: 'Enfrentem o Fato e Vejam o que Acontece',
    day: 10,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.dependencia,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Todos nós já experimentámos o sentimento de uma terrível solidão, na qual os livros, a religião, tudo desapareceu e nós ficamos terrivelmente, interiormente, sós, vazios. A maioria de nós não consegue enfrentar esse vazio, essa solidão, e foge dela. A dependência é uma das coisas para as quais fugimos, das quais dependemos, porque não suportamos estar sós connosco mesmos. Precisamos de ter o rádio, ou um livro, ou alguém para conversar, um incessante palrar sobre isto e aquilo, sobre arte e sobre cultura. Assim, chegamos àquele ponto em que sabemos que temos esta extraordinária sensação de auto-isolamento. Podemos ter um excelente emprego, trabalhar arduamente, escrever livros, mas interiormente temos este enorme vácuo. Queremos preenchê-lo, e a dependência é uma das formas de o fazermos. Utilizamos a dependência, o divertimento, os trabalhos para a igreja, as religiões, a bebida, as mulheres, mil e uma coisas para o preenchermos, para o encobrirmos. Se constatarmos que é completamente inútil tentar encobri-lo, completamente inútil, não verbalmente, não com convicção e portanto com acordo e determinação, mas se conseguirmos ver o caráter totalmente absurdo disso, então somos confrontados com um fato. Não é uma questão de como se ser livre da dependência; isso não é um fato; isso é apenas uma reação a um fato. Por que é que não enfrento o fato e vejo o que acontece? Surge então a questão do observador e da coisa observada. O observador diz: "Estou vazio; não gosto de me sentir assim", e foge desse sentimento. O observador diz: "Sou diferente do vazio". Mas o observador é o vazio; não se trata do vazio a ser visto por um observador. O observador é a coisa observada. Dá-se uma imensa revolução no pensar e no sentir quando tal acontece.'
    ],
  ),
  Reflection(
    id: '70',
    title: 'O Apego É uma Fuga',
    day: 11,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Tentem estar conscientes do vosso condicionamento. Só o podem conhecer de forma indireta, em relação a algo. Não é possível estarem conscientes do vosso condicionamento como uma abstração, porque nesse caso tudo se passa a um nível meramente verbal, com pouco significado. Estamos apenas conscientes do conflito. O conflito existe quando não há integração entre o desafio e a resposta. Este conflito é o resultado do nosso condicionamento. O condicionamento é apego: apego ao trabalho, à tradição, à propriedade, às pessoas, às ideias, e assim por diante. Se não houvesse qualquer apego, haveria condicionamento? É claro que não. Portanto, por que é que sentimos apego? Sinto apego ao meu país, porque, através da identificação com ele, torno-me alguém. Identifico-me com o meu trabalho, e assim o trabalho torna-se importante. Eu sou a minha família, a minha propriedade; estou apegado a tudo isso. O objeto do meu apego oferece-me o meio de fuga ao meu próprio vazio. O apego é uma fuga, e é a fuga que fortalece o condicionamento.'
    ],
  ),
  Reflection(
    id: '71',
    title: 'Estar Só',
    day: 12,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Estar só, que não é o mesmo que defender uma filosofia da solidão, é obviamente estar num estado de revolução contra toda a organização da sociedade, não apenas desta sociedade, mas da sociedade comunista, da fascista, de qualquer forma de sociedade que constitua a brutalidade organizada, o poder organizado. E isso significa uma extraordinária percepção dos efeitos do poder. Senhores, já alguma vez repararam nos soldados durante os treinos? Eles já não são seres humanos, são máquinas, eles são os vossos filhos, os meus filhos, ali em sentido, sob o sol. Isto acontece aqui, na América, na União Soviética, e em toda a parte do mundo, não apenas ao nível governamental, mas também ao nível monástico, com a pertença a mosteiros, a ordens, a grupos que detêm um poder surpreendente. E é apenas a mente que não pertence a nada que pode estar só. E a solidão não é algo que possa ser cultivado. Conseguem perceber isso? Quando se vê tudo isto, fica-se de fora, e não se é convidado para jantar por nenhum governador, por ne­nhum presidente. Nessa solidão existe humildade. É esta solidão que conhece o amor, e não o poder. O homem ambicioso, seja ou não religioso, nunca poderá saber o que é o amor. Portanto, se formos capazes de ver tudo isto, então temos essa qualidade de viver na totalidade, e consequentemente, de agir na totalidade. Isto vem por meio do autoconhecimento.'
    ],
  ),
  Reflection(
    id: '72',
    title: 'Ansiar é Sempre Ansiar',
    day: 13,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para evitarmos o sofrimento, cultivamos o desapego. Sabendo de antemão que o apego, mais tarde ou mais cedo, traz consigo o sofrimento, queremos tornar-nos desapegados. O apego é uma fonte de satisfação, mas ao nos apercebermos da dor que ele acarreta, desejamos encontrar satisfação de outra forma, através do desapego. O desapego é o mesmo que o apego, na medida em que deseja a satisfação. Portanto, aquilo de que estamos verdadeiramente à procura é de satisfação; desejamos ardentemente ser satisfeitos, a qualquer preço.  Tornamo-nos dependentes ou apegados, porque isso nos dá prazer, segurança, poder, uma sensação de bem-estar, embora ele encerre em si mesmo a tristeza e o medo. Procuramos o desapego pela mesma razão, pela procura de prazer, de modo a não sermos magoados, a não sermos feridos interiormente. A nossa busca tem como objetivo o prazer, a satisfação. Sem condenar ou justificar, devemos tentar compreender este processo, pois a menos que o compreendamos, não poderemos sair da nossa confusão e da nossa contradição. Poderá o anseio alguma vez ser satisfeito, ou será ele um poço sem fundo? Quer ansiemos pelo mais baixo quer pelo mais elevado, ansiar é sempre ansiar, um fogo ardente, e aquilo que é passível de ser consumido por ele, em pouco tempo se transforma em cinzas; mas o anseio pela satisfação permanece, sempre a arder, sempre a consumir, e não há um fim para isso. O apego e o desapego vão a par na criação de amarras, e ambos devem ser transcendidos.'
    ],
  ),
  Reflection(
    id: '73',
    title: 'Intensidade Livre de Qualquer Apego',
    day: 14,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.apego,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'No estado de paixão sem causa, existe intensidade livre de qualquer apego; mas quando a paixão tem uma causa, existe apego, e o apego é o começo da tristeza. A maioria de nós está apegada; agarramo-nos a uma pessoa, a um país, a uma crença, a uma ideia, e quando nos é tirado o objeto do nosso apego, ou, em vez disso, perde significado, encontramo-nos vazios, insuficientes. E nós tentamos preencher este vazio agarrando-nos a outra coisa, a algo que, uma vez mais, se torna objeto da nossa paixão.'
    ],
  ),
  Reflection(
    id: '74',
    title: 'O Relacionamento É um Espelho',
    day: 15,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Certamente é apenas no relacionamento que o processo daquilo que sou se desenrola, não é verdade? O relacionamento é um espelho no qual me vejo tal como sou; mas como a maior parte de nós não gosta do que é, começamos a disciplinar, positiva ou negativamente, o que percepcionamos no espelho do relacionamento. Ou seja, eu descubro algo no relacionamento, na ação do relacionamento, e não gosto do que descubro. Portanto, começo a modificar aquilo de que não gosto, aquilo que considero desagradável. Quero mudar isso, o que significa que já tenho um padrão do que deveria ser. A partir do momento em que existe um padrão do que eu deveria ser, deixa de haver a compreensão do que eu sou. A partir do momento em que tenho uma imagem do que quero ser, ou do que deveria ser, ou do que não posso ser, um padrão de acordo com o qual quero mudar-me a mim mesmo, então, certamente, não pode haver a compreensão do que eu sou no momento do relacionamento. Penso que é muito importante que compreendamos isto, porque penso que é aqui que a maioria de nós se perde. Nós não queremos saber o que somos de fato num determinado momento do relacionamento. Se só estamos preocupados em melhorarmo-nos a nós mesmos, não existe compreensão de nós próprios, "do que é".'
    ],
  ),
  Reflection(
    id: '75',
    title: 'A Função do Relacionamento',
    day: 16,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O relacionamento é inevitavelmente doloroso, e a nossa existência diária é a prova disso. Se não existir qualquer tensão no relacionamento, deixa de haver relacionamento e passa a haver apenas um confortável estado de adormecimento, um soporífero, que muitas pessoas preferem e até desejam. O conflito ocorre entre este desejo de conforto e os fatos, entre a ilusão e a realidade. Se reconhecerem a ilusão, então poderão, ao pô-la de lado, dirigir a vossa atenção para a compreensão do relacionamento. Mas se procurarem segurança no relacionamento, ele transforma-se num investimento no conforto, na ilusão, e a grandeza do relacionamento é a sua própria insegurança. Ao procurarem segurança no relacionamento, estão a impedir a sua função, e isso traz consigo as suas próprias ações e os seus próprios infortúnios. Decerto que a função do relacionamento é a de revelar o estado de todo o nosso ser. O relacionamento é um processo de auto-revelação, de autoconhecimento. Esta auto-revelação é dolorosa, exige um ajustamento constante, uma flexibilidade de pensamento-emoção. É uma luta dolorosa, com alguns períodos de uma paz iluminada. Mas a maioria de nós evita ou põe de lado a tensão no relacionamento, preferindo a facilidade e o conforto de uma dependência satisfatória, de uma segurança que não é desafiada, de um porto seguro. Então, a família e outros relacionamentos tornam-se um refúgio, o refúgio dos irrefletidos. Quando a insegurança se transforma em dependência, como é inevitável que aconteça, então o relacionamento em que tal acontece é posto de lado e um novo relacionamento é iniciado na esperança de que a segurança permanente seja encontrada; mas não há segurança no relacionamento, e a dependência apenas serve para alimentar o medo. Sem se ter a compreensão do processo da segurança e do medo, o relacionamento transforma-se num impedimento que nos condiciona, num caminho de ignorância. Então toda a existência se transforma em luta e dor, e não há outra forma de se sair disso que não seja o pensamento correto, que acontece com o autoconhecimento.'
    ],
  ),
  Reflection(
    id: '76',
    title: 'Como Pode Haver Amor Verdadeiro?',
    day: 17,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A imagem que vocês têm de uma pessoa, a imagem que têm dos vossos políticos, do primeiro-ministro, do vosso deus, da vossa mulher, dos vossos filhos, essa imagem está a ser observada. E essa imagem foi criada através do vosso relacionamento, ou através dos vossos medos, ou através das vossas esperanças. O prazer sexual e outros que tiveram com a vossa mulher, o vosso marido, a raiva, a lisonja, o conforto, e todas as coisas inerentes a vossa vida familiar, que é, na verdade, uma vida mortal, criaram uma imagem da vossa mulher ou do vosso marido. Munidos dessa imagem, vocês olham. Da mesma forma, a vossa mulher ou o vosso marido têm uma imagem vossa. Portanto, o relacionamento entre vocês e a vossa mulher ou o vosso marido, entre vocês e o político é, na realidade, o relacionamento entre essas duas imagens. Certo? Isto é um fato. Como podem duas imagens, que são o resultado do pensamento, do prazer, e assim por diante, ter qualquer afeição ou amor? Portanto, o relacionamento entre dois indivíduos, quer sejam muito próximos quer muito distantes, é um relacionamento de imagens, de símbolos, de memórias. E como poderá haver nisso um amor verdadeiro?'
    ],
  ),
  Reflection(
    id: '77',
    title: 'Somos Aquilo que Possuímos',
    day: 18,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para se compreender o relacionamento, tem de haver uma atenção passiva, a qual não destrói o relacionamento. Pelo contrário, ela torna o relacionamento muito mais vital, muito mais importante. Então, existe nesse relacionamento uma possibilidade de afeição verdadeira; existe uma ternura, uma sensação de proximidade, que não é um mero sentimento ou uma sensação. E se formos capazes de ter essa aproximação, esse tipo de relacionamento em relação a tudo, então os nossos problemas serão facilmente resolvidos, os problemas que têm que ver com os bens, com as posses. Porque nós somos aquilo que possuímos. O homem que possui dinheiro é o dinheiro. O homem que se identifica com a propriedade é a propriedade, a casa, a mobília. O mesmo acontece com as ideias, ou com as pessoas; e quando existe o sentimento de posse, não há relacionamento. Mas a maior parte de nós é possessiva, porque não tem mais nada se não possuir. Somos como conchas vazias se não possuímos, se não preenchermos a nossa vida com mobiliário, com música, com conhecimento, com isto e aquilo. E essa concha faz imenso barulho, e a esse barulho chamamos nós viver; e com isso ficamos satisfeitos. E quando se dá uma ruptura, um corte em relação a isso, então surge a tristeza, porque então descobrimo-nos subitamente tal como somos, uma concha vazia, com pouco significado. Assim, estar consciente de todo o conteúdo do relacionamento é ação; e a partir dessa ação existe uma possibilidade de uma relação verdadeira, uma possibilidade de descoberta da sua grande profundidade, da sua grande importância, e de se saber o que é o amor.'
    ],
  ),
  Reflection(
    id: '78',
    title: 'Estar em Relação',
    day: 19,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Sem relacionamento não há existência: ser é estar em relação. A maioria de nós parece não perceber isto, que o mundo é o meu relacionamento com os outros, quer seja com uma só pessoa quer seja com muitas. O meu problema é o problema do relacionamento. O que sou, o que projeto, e, como é óbvio, se não me compreender a mim mesmo todo o relacionamento se torna uma confusão que se expande em círculos cada vez maiores. Portanto, o relacionamento tem uma importância extraordinária, não em relação à assim chamada massa, a multidão, mas no mundo da minha família e dos meus amigos, por mais pequeno que ele possa ser, o meu relacionamento com a minha mulher, com os meus filhos, com o meu vizinho. Num mundo onde abundam as grandes organizações, as grandes mobilizações de pessoas, os movimentos de massas, receamos agir ao nível da pequena escala; temos medo de ser uma simples pessoa que limpa o seu próprio quintal. Dizemos a nós mesmos: "O que está ao meu alcance fazer? Devo juntar-me a um movimento de massas para que possa haver uma reforma?". Pelo contrário, a verdadeira revolução não acontece através de movimentos de massas, mas pela reavaliação interior do relacionamento, é essa a verdadeira reforma, uma revolução radical e contínua. Receamos começar a uma pequena escala. Pelo fato de o problema ser tão vasto, pensamos que temos de o enfrentar acompanhados de um vasto número de pessoas, de uma grande organização, de movimentos de massas. Temos certamente de começar por atacar o problema numa pequena escala, e a pequena escala é o "eu" e o "tu". Quando me compreendo a mim mesmo, compreendo o outro, e dessa compreensão nasce o amor. O amor é o fator que falta; existe uma falta de afeição, de ternura no relacionamento; e porque nos falta esse amor, essa ternura, essa generosidade, essa compaixão no relacionamento, refugiamo-nos na ação das massas, a qual produz mais confusão, mais sofrimento. Preenchemos os nossos corações com letras de imprensa que falam da reforma mundial, e não olhamos para esse único fator de solução que é o amor.'
    ],
  ),
  Reflection(
    id: '79',
    title: 'Vocês e Eu Somos o Problema, não o Mundo',
    day: 20,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.relacionamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O mundo não é algo que esteja separado de vocês e de mim; o mundo, a sociedade, é o relacionamento que estabelecemos entre nós. Portanto, vocês e eu somos o problema, e não o mundo, porque o mundo é a projeção de nós mesmos, e para compreendermos o mundo, temos de nos compreender a nós mesmos. Esse mundo não é separado de nós; nós somos o mundo, e os nossos problemas são os problemas do mundo.'
    ],
  ),
  Reflection(
    id: '80',
    title: 'Não Existe uma tal Coisa a que se Possa Chamar Viver Sozinho',
    day: 21,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Nós queremos fugir da nossa solidão, com os seus medos que nos fazem entrar em pânico, e portanto dependemos de outrem, enriquecemo-nos com o companheirismo, e assim por diante. Nós somos as figuras principais, e os outros tornam-se peões no nosso jogo; e quando o peão se vira e exige algo em troca, ficamos chocados e magoados. Se a nossa fortaleza for resistente, sem apresentar nenhuma brecha, este ataque vindo do exterior traz-nos poucas consequências. As tendências peculiares que vão surgindo com a idade devem ser compreendidas e corrigidas enquanto ainda somos capazes de uma auto-observação e de um estudo de nós mesmos desapegados e tolerantes; os nossos medos devem ser observados e compreendidos no presente. As nossas energias devem ser direcionadas, não apenas para a compreensão das pressões e das exigências exteriores pelas quais somos responsáveis, mas também para a compreensão de nós mesmos, da nossa solidão, dos nossos medos, exigências e fragilidades. Não existe tal coisa a que se possa chamar viver sozinho, pois todo o viver é relacionamento; mas viver sem um relacionamento direto exige uma inteligência elevada, uma atenção mais viva e maior relativamente à autodescoberta. Uma existência "solitária", sem esta atenção penetrante e fluida, fortalece as tendências que já são dominantes, dando assim origem ao desequilíbrio, à distorção. É no presente que temos de nos tornar conscientes dos hábitos rígidos e peculiares do pensamento-sentimento que vêm com a idade, e através dessa compreensão devemos acabar com eles. Somente as riquezas interiores nos podem trazer paz e alegria.'
    ],
  ),
  Reflection(
    id: '81',
    title: 'A Libertação do Medo',
    day: 22,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Será possível para a mente esvaziar-se completamente do medo? Qualquer tipo de medo alimenta a ilusão; torna a mente embotada, rasteira. Onde existe o medo, não pode haver, como é óbvio, liberdade, e sem liberdade não há amor. E a maioria de nós tem alguma forma de medo; medo do escuro, medo da opinião pública, medo de cobras, medo da dor física, medo da velhice, medo da morte. Temos, literalmente, milhares de medos. E será possível estarmos completamente livres do medo? Podemos observar o que o medo faz a cada um de nós. Faz com que digamos mentiras; corrompe-nos de diversas formas; torna a mente vazia, superficial. Existem cantos escuros na mente que nunca poderão ser investigados e expostos enquanto tivermos medo. A autoprotecção física, a urgência instintiva de nos mantermos afastados de uma cobra venenosa, de um precipício, de evitarmos ser atropelados pelo autocarro, e assim por diante, é saudável e normal. Mas eu estou a colocar a questão da autoproteção psicológica que nos faz temer a doença, a morte, um inimigo. Quando procuramos qualquer forma de preenchimento, quer seja através da pintura, da música, da relação, ou do que se quiser, existe sempre medo. Portanto, o que é importante é estarmos conscientes de todo este processo de nós mesmos, observar, aprender acerca dele, e não perguntarmos como é que nos podemos ver livres do medo. Quando apenas desejamos ver-nos livres do medo, encontramos formas e meios de lhe escaparmos, e assim nunca poderá haver a libertação do medo.'
    ],
  ),
  Reflection(
    id: '82',
    title: 'Lidar com o Medo',
    day: 23,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Receamos a opinião pública, receamos não alcançar, não preencher, receamos não ter a oportunidade; e em tudo isto há esta extraordinária sensação de culpa, fizemos algo que não deveríamos ter feito; a sensação de culpa na própria ação; somos saudáveis, e existem pessoas que são pobres e doentes; temos comida e há outros que a não têm. Quanto mais a mente investiga, penetra, pergunta, tanto maior é a sensação de culpa, ansiedade... O medo é a urgência que procura um Mestre, um guru; o medo é esta cobertura de responsabilidade, de que toda a gente gosta tanto, ser responsável. Vocês determinam-se a ser corajosos para enfrentarem os acontecimentos da vida, ou meramente afastam o medo através da racionalização, ou encontram explicações que darão satisfação à mente que está apanhada pelo medo? Como é que lidam com isto? Ligam o rádio, lêem um livro, dirigem-se a um templo, agarram-se a alguma forma de dogma, crença? O medo é a energia destrutiva que existe no homem. Ele debilita a mente, distorce o pensamento, conduz a todo o tipo de teorias astuciosas e sutis, superstições absurdas, dogmas e crenças. Se vocês vêem que o medo é destrutivo, então de que modo procedem para limpar a vossa mente? Vocês dizem que ao investigar a causa do medo ficarão livres do medo. Será que isso é verdade? Tentar desvendar e conhecer a causa do medo não o elimina.'
    ],
  ),
  Reflection(
    id: '83',
    title: 'A Porta para a Compreensão',
    day: 24,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não se pode fazer desaparecer o medo sem a compreensão, sem se ver verdadeiramente a natureza do tempo, o que significa pensamento, o que significa palavra. A partir disso surge a questão: existirá pensamento sem palavra, existirá o pensar sem a palavra que é memória? Senhores, sem se ver a natureza da mente, o movimento da mente, o processo de se conhecer a si mesmo, o mero fato de dizer que me devo libertar do medo, tem muito pouco significado. Temos de observar o medo inserido no contexto da mente. Para ver, para aprofundar tudo isto, é necessária energia. A energia não vem através da alimentação, essa é uma parte da necessidade física. Mas para ver, no sentido em que estou a usar essa palavra, é necessária uma imensa energia; e essa energia é dissipada quando nos estamos a confrontar com as palavras, quando estamos a resistir, a condenar, quando estamos cheios de opiniões que nos impedem de olhar, de ver, toda a nossa energia é dissipada nisso. Assim, na consideração desta percepção, deste ver, abrimos novamente a porta.'
    ],
  ),
  Reflection(
    id: '84',
    title: 'O Medo Faz-nos Obedecer',
    day: 25,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Por que fazemos tudo isto, obedecer, seguir, copiar? Porque? Porque, interiormente, tememos a incerteza. Queremos estar certos de algo, financeiramente, moralmente, queremos ser aprovados, queremos estar numa posição segura, queremos evitar ser confrontados com problemas, com a dor, com o sofrimento, queremos estar numa redoma. Assim, o medo, de forma consciente ou inconsciente, faz-nos obedecer ao Mestre, ao líder, ao padre, ao governo. O medo também nos controla no sentido de não nos deixar fazer algo que pode ser maléfico para os outros, porque sabemos que seremos castigados. Portanto, por detrás de todas estas ações, ganâncias, buscas, esconde-se este desejo de certeza, este desejo de nos sentirmos assegurados. Portanto, sem resolvermos o medo, o mero ato de obedecer ou de ser obedecido tem pouca importância; o que tem significado é a compreensão deste medo, dia a dia, e observar como o medo se revela a si mesmo de formas diferentes. E só quando estamos libertos do medo que existe essa qualidade interior da compreensão, a solidão na qual não existe acumulação de conhecimento ou de experiência, e é somente isso que nos dá uma extraordinária claridade na busca do real.'
    ],
  ),
  Reflection(
    id: '85',
    title: 'Face a Face com o Fato',
    day: 26,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Nós temos medo de um fato ou de uma ideia a respeito de um fato? Tememos a coisa tal como ela é, ou o que pensamos que ela é? Tomemos como exemplo a morte. Temos medo do fato que constitui a morte ou da ideia da morte? O fato é uma coisa e a ideia sobre o fato é outra. Tenho medo da palavra morte ou do fato em si mesmo? Porque receio a palavra, a ideia, nunca compreendo o fato, nunca olho para o fato, nunca estou em rela­ção direta com o fato. É somente quando me encontro numa comunhão completa com o fato que não existe medo. Se não estiver em comunhão com o fato, então há medo, e não pode haver comunhão com o fato enquanto eu tiver uma ideia, uma opinião, uma teoria, a respeito do fato; portanto tenho de perceber de forma muito clara se tenho medo da palavra, da ideia, ou do fato. Se me encontrar face a face com o fato, não há nada a compreender sobre ele: o fato está lá, e eu posso lidar com ele. Se eu recear a palavra, então devo compreender a palavra, investigar profundamente todo o processo do que a palavra, o termo significa. É a minha opinião, a minha ideia, a minha experiência, o meu conhecimento sobre o fato, que cria o medo. Enquanto houver verbalização do fato, o ato de dar nome ao fato, e com isso identificá-lo ou condená-lo, enquanto o pensamento estiver a julgar o fato a partir da sua posição de observador, terá de haver medo. O pensamento é o produto do passado; só pode existir através da verbalização, dos símbolos, das imagens. Enquanto o pensamento estiver a julgar ou a traduzir o fato, haverá sempre medo.'
    ],
  ),
  Reflection(
    id: '86',
    title: 'Entrar em Contato com o Medo',
    day: 27,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Existe o medo físico. Percebem a que me estou a referir, por exemplo, quando vocês vêem uma cobra, um animal selvagem, instintivamente surge o medo, esse é um medo normal, saudável e natural. Não é medo, é um desejo de se proteger, isso é normal. Mas a proteção psicológica de si próprio, isto é, o desejo de estar sempre seguro, dá origem ao medo. Uma mente que está sempre à procura de se sentir segura é uma mente morta, porque não há nenhuma certeza na vida, não há nenhuma permanência. Quando se entra em contato direto com o medo, dá-se uma resposta dos nervos e de tudo o resto. Então, quando a mente já não está a fugir através das palavras ou de qualquer tipo de atividade, não existe divisão entre o observador e a coisa ob­servada enquanto medo. É apenas a mente que foge que se separa a si mesma do medo. Mas quando há um contato direto com o medo, não há observador, não há nenhuma entidade que diz: "Tenho medo". Portanto, no momento em que se está em contato direto com a vida, com o que quer que seja, não há divisão, e é esta divisão que alimenta a competição, a ambição e o medo. Assim, o que é importante não é "como ficar livre do medo?". Se procurarem uma forma, um método, um sistema para se livrarem do medo, serão eternamente apanhados nas malhas do medo. Mas se compreenderem o medo, o que só pode acontecer quando entrarem em contato direto com ele, do mesmo modo que entram em contato com a fome, do mesmo modo que entram em contato direto quando são ameaçados de perderem o vosso emprego, então fazem qualquer coisa; só então poderão descobrir que todo o medo cessa, quero dizer todo o medo, não este ou aquele tipo específico de medo.'
    ],
  ),
  Reflection(
    id: '87',
    title: 'O Medo é a Não-Aceitação do Que É',
    day: 28,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O medo encontra diversas fugas. A variedade mais comum é a identificação, não é verdade? A identificação com o país, com a sociedade, com uma ideia. Já repararam na forma como respondem quando vêem uma procissão, militar ou religiosa, ou quando o país está em risco de ser invadido? Então identificam-se com o país, com um ser, com uma ideologia. Noutras alturas, identificam-se com o vosso filho, a vossa mulher, com uma determinada forma de ação, ou de inação. A identificação é um processo de auto-esquecimento. Enquanto eu estiver consciente do "eu", sei que haverá dor, luta, um medo constante. Mas se eu puder identificar- me com algo maior, com algo que valha a pena, com a beleza, com a vida, com a verdade, com a crença, com o conhecimento, pelo menos temporariamente, dá-se uma fuga do "eu", não é verdade? Se falo do "meu país", por momentos estou a esquecer-me de mim mesmo, não estou? Se puder dizer algo sobre Deus, esqueço-me de mim. Se me puder identificar com a minha família, com um grupo, com um determinado partido, com uma certa ideologia, então verifica-se uma fuga temporária. Será que agora sabemos o que é o medo? Não será ele a não-aceitação "do que é"? Temos de compreender a palavra aceitação. Não estou a utilizar esta palavra no sentido de um esforço que é feito para se aceitar algo. Não há nada que aceitar quando se compreende "o que é". Quando não vejo claramente "o que é", então dou início ao processo de aceitação. Portanto, o medo é a não-aceitação "do que é".'
    ],
  ),
  Reflection(
    id: '88',
    title: 'A Desordem que É Criada pelo Tempo',
    day: 29,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O tempo é o movimento que parte "do que é" para "o que devia ser". Tenho medo, mas um dia conseguirei libertar-me do medo; portanto, o tempo é necessário para que me possa libertar do medo, ou pelo menos é assim que pensamos. Para passar "do que é" para "o que devia ser" preciso de tempo. Agora, tempo significa que existe esforço nesse intervalo entre "o que é" e "o que devia ser". Não gosto do medo, e portanto vou fazer um esforço para o compreender, para o analisar, para o dissecar, ou vou descobrir a sua causa, ou vou fugir totalmente a ele. Tudo isto implica esforço, e o esforço é aquilo a que estamos acostumados. Estamos permanentemente em conflito entre "o que é" e "o que devia ser". O que eu devia ser é uma ideia, e a ideia é fictícia, não é "o que eu sou", que é o fato; e "o que eu sou" só pode ser alterado quando compreendo a desordem que é criada pelo tempo. Portanto, será que é possível que eu me consiga ver totalmente livre do medo, completamente, no mesmo instante? Se permito que o medo permaneça, criarei sempre desordem, não um meio de me ver definitivamente livre do medo. Assim, não existe um processo gradual para nos libertarmos do medo, da mesma forma que não existe nenhum processo gradual que nos permita libertar do veneno do nacionalismo. Se vocês forem nacionalistas e disserem que um dia todos os homens se sentirão irmãos, no intervalo entre uma coisa e outra, acontecem guerras, ódios, miséria, e toda esta aterradora divisão entre um homem e outro; portanto, o tempo está a criar a desordem.'
    ],
  ),
  Reflection(
    id: '89',
    title: 'De que forma Encaro a Raiva?',
    day: 30,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'É óbvio que olho para ela como um observador que está com raiva. Digo: "Estou enraivecido". No momento da raiva não existe um "eu"; o "eu" surge imediatamente a seguir, o que implica tempo. Será que posso olhar para o fato sem o fator tempo, que é o pensamento, que é a palavra? Isto acontece quando existe o ato de olhar sem a presença do observador. Vejam aonde isto me conduziu. Começo agora a aperceber-me de um modo de olhar, percepção sem opinião, sem conclusão, sem condenação ou julgamento. Assim, eu percebo que pode haver o ato de "olhar" sem pensamento, que é a palavra. Portanto, a mente está para além das amarras das ideias, do conflito da dualidade e de tudo o resto que se relaciona com isto. Portanto, será possível olhar para o medo sem o encarar como um fato isolado? Se isolarem um fato que não tenha aberto a porta a todo o universo da mente, então voltemos ao fato e comecemos outra vez, tomando outro fato de forma a que vocês mesmos comecem a ver esta coisa extraordinária da mente, para que possam ter a chave, possam abrir a porta, possam entrar profundamente nisso. Ao considerarmos um determinado medo, o medo da morte, o medo do vizinho, o medo de o nosso cônjuge nos dominar, vocês sabem, toda a questão do domínio, será que isso é suficiente para abrir a porta? Isso é tudo o que importa, não como nos vermos livres dele, porque no momento em que vocês abrirem a porta, o medo desvanece-se completamente. A mente é o resultado do tempo, e o tempo é a palavra, como é extraordinário pensar nisto! O tempo é pensamento; é o pensamento que alimenta o medo, é o pensamento que alimenta o medo da morte; e é o tempo, que é pensamento, que tem em suas mãos todas as complexidades e todas as subtilezas do medo.'
    ],
  ),
  Reflection(
    id: '90',
    title: 'A Raiz de Todo o Medo',
    day: 31,
    month: Months.marco,
    monthFilters: ['mar'],
    tag: Tags.medo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A ânsia por ser outra coisa diferente do que se é dá origem ao medo; ser, alcançar e, portanto, depender, engendra o medo. O estado em que não existe medo não é negação, não é o oposto do medo nem tão-pouco é coragem. Na compreensão da causa do medo, reside o seu fim, não no ato de se tornar corajoso, porque em todo o "vir a ser" habita a semente do medo. A dependência de coisas, de pessoas ou de ideias alimenta o medo; a dependência nasce da ignorância, da ausência de autoconhecimento, da pobreza interior; o medo dá origem à incerteza da mente-coração, impedindo a comunicação e a compreensão. Através da autoconsciência começamos a descobrir e, portanto, a compreender a causa do medo, não apenas os medos superficiais, mas também os medos com causas muito profundas, os medos que se vão acumulando. O medo é simultaneamente de natureza interna e adquirido; está relacionado com o passado, e para se poder libertar o pensamento-sentimento dele, o passado deve ser compreendido através do presente. O passado está sempre a querer originar o presente, o qual acaba por se tornar a memória de identificação do "eu" e do "meu", que em conjunto constitui o "eu". O "eu" é a raiz de todo o medo.'
    ],
  ),
  Reflection(
    id: '91',
    title: 'Só Existe o Desejo',
    day: 1,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não existe qualquer entidade separada do desejo; só existe o desejo, não existe um sujeito que deseja. O desejo adota diferentes máscaras em diferentes ocasiões, dependendo dos seus interesses. A memória destes interesses que vão variando entra em contato com o novo e isso origina o conflito, e assim nasce o sujeito que escolhe, o sujeito que se estabelece a si mesmo como uma entidade separada e distinta do desejo. Mas a entidade não é separada das suas qualidades. A entidade que tenta preencher ou fugir do vazio, da incompletude, da solidão não é diferente daquilo que está a tentar evitar; ela é isso. Ela não pode fugir de si mesma; tudo o que pode fazer é compreender-se a si mesma. Ela é a sua solidão, o seu vazio; e enquanto ela encarar tudo isso como separado de si mesma, estará mergulhada na ilusão e no eterno conflito. Só quando ela experimenta de forma direta que ela é a sua própria solidão, é que pode libertar-se do medo. O medo só existe na relação com uma ideia, e a ideia é a resposta da memória sob a forma de pensamento. O pensamento é o resultado da experiência; e embora ele possa refletir sobre o vazio, ter sensações em relação a ele, não pode conhecê-lo de forma direta. A palavra solidão, com as suas memórias de dor e de medo, impede o ato de experimentar de forma nova. A palavra é memória, e quando a palavra deixa de ser importante, então a relação entre aquele que experimenta e o que é experimentado é totalmente diferente; então essa experiência é direta e não feita através de palavras ou da memória; então aquele que experimenta é a experiência, e só isso pode trazer a libertação do medo.'
    ],
  ),
  Reflection(
    id: '92',
    title: 'Compreender o Desejo',
    day: 2,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Temos de compreender o desejo; e é muito difícil compreendermos algo que é tão vital, tão exigente, tão urgente, porque na própria satisfação do desejo é engendrada a paixão, com o seu prazer e com a sua dor. E se quisermos compreender o desejo, é óbvio que não pode haver escolha. Não podemos julgar o desejo como sendo bom ou mau, nobre ou ignóbil, nem podemos dizer: "Vou conservar este desejo e negar aquele outro". Devemos pôr tudo isso de lado se quisermos descobrir a verdade sobre o desejo, a sua beleza, a sua fealdade, ou o que quer que seja.'
    ],
  ),
  Reflection(
    id: '93',
    title: 'O Desejo Tem de Ser Compreendido',
    day: 3,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Continuemos a refletir sobre o desejo. Nós conhecemos, não é verdade, o desejo que se contradiz a si mesmo, que é tortuoso, que nos puxa em direções diferentes; a dor, o tumulto, a ansiedade do desejo, e a tentativa de o disciplinar, de o controlar. E, na eterna batalha com ele nós contorcemo-lo alterando a sua forma, tornando-o irreconhecível; mas ele permanece lá, constantemente a ver, à espera, a puxar. Façam o que quiserem, sublimem-no, fujam dele, neguem-no ou aceitem-no, façam-lhe todas as concessões, ele estará sempre lá. E nós sabemos o quanto os mestres religiosos e outros nos disseram que devíamos não ter desejos, que devíamos cultivar o desapego, estar livres do desejo, o que é verdadeiramente absurdo, porque o desejo tem de ser compreendido, não destruído. Se vocês destruírem o desejo, podem estar a destruir também a própria vida. Se perverterem o desejo, o moldarem, o controlarem, o dominarem, o suprimirem, podem estar a destruir algo extraordinariamente belo.'
    ],
  ),
  Reflection(
    id: '94',
    title: 'A Qualidade do Desejo',
    day: 4,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O que acontece se não condenarem o desejo, não o avaliarem como sendo bom ou mau, mas estiverem simplesmente conscientes dele? Pergunto-me se vocês saberão o que significa estar consciente de algo? A maioria de nós não está consciente, porque está muito acostumada a condenar, a julgar, a avaliar, a identificar, a escolher. A escolha, como é óbvio, impede o estar consciente, porque a escolha tem sempre lugar em resultado do conflito. Estar-se consciente quando se entra numa casa, ver toda a mobília, a carpete ou a ausência dela, e assim por diante — apenas ver, estar consciente disso tudo sem qualquer sentido de julgamento — é muito difícil. Já alguma vez tentaram olhar para uma pessoa, uma flor, uma ideia, uma emoção, sem qualquer tipo de escolha, sem qualquer tipo de julgamento? E se fizermos o mesmo em relação ao desejo, se vivermos com ele, sem o negarmos e sem dizermos: "O que farei com este desejo? É tão feio, tão desenfreado, tão violento", sem lhe darmos um nome, um símbolo, sem o cobrirmos com uma palavra, então continuará ele a causar algum tumulto? Será, então, que o desejo é algo que deve ser posto de lado, que deve ser destruído? Queremos destruí-lo, porque um desejo vai contra o outro, dando origem a conflito, sofrimento e contradição; e é fácil observarmos o quanto tentamos fugir a este conflito permanente. Portanto, será possível estarmos conscientes da totalidade do desejo? O que entendo por totalidade não é apenas um desejo ou muitos desejos, mas a total qualidade do próprio desejo.'
    ],
  ),
  Reflection(
    id: '95',
    title: 'Por que Não Devemos Ter Prazer?',
    day: 5,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Observamos um bonito pôr-do-sol, uma linda árvore, um rio com um movimento largo, sinuoso, um rosto belo, e olhar para isso dá-nos um grande prazer, deleita-nos. Que mal há nisso? Parece-me que a confusão e o sofrimento começam quando esse rosto, esse rio, essa nuvem, essa montanha se transforma em memória, e essa memória, então, exige uma maior continuação do prazer; queremos que essas coisas se repitam. Todos nós sabemos isto. Conheci um determinado prazer, ou vocês sentiram deleite com algo, e queremos que isso se repita. Quer seja um prazer de ordem sexual, artística, intelectual, ou de qualquer outra ordem, queremos que se repita, e penso que é aí que o prazer começa a obscurecer a mente e cria valores que são falsos, que não são reais. O que importa é compreender o prazer, não tentarmos vermo-nos livres dele, isso é demasiado estúpido. Ninguém se pode ver livre do prazer. Mas é essencial compreender a natureza e a estrutura do prazer; porque se a vida for só prazer, e se é isso que queremos, então juntamente com o prazer vêm o sofrimento, a confusão, as ilusões, os falsos valores que criamos, e portanto não pode haver clareza alguma.'
    ],
  ),
  Reflection(
    id: '96',
    title: 'Uma Reação Saudável, Normal',
    day: 6,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Tenho de descobrir por que o desejo tem uma força tão grande na minha vida. Pode ser correto e pode não o ser. Tenho de o descobrir. Vejo isso. O desejo surge, o que é uma reação, o que é uma reação saudável e normal; caso contrário, estaríamos mortos. Vejo algo bonito e digo: "Meu Deus, quero aquilo". Se não quisesse, estaria morto. Mas na procura constante da satisfação do desejo há dor. Esse é o problema, há prazer e há dor. Vejo uma bela mulher, e ela é mesmo bonita; seria completamente absurdo negá-lo, dizer: "Não, ela não é bonita". Trata-se de um fato. Mas o que dá continuidade ao prazer? É óbvio que é o pensamento, o pensar nele... Penso nele. Deixa de haver relação direta com o objeto, que é o desejo, mas agora o pensamento aumenta esse desejo ao pensar nele, ao formar imagens, quadros, ideias... O pensamento chega e diz: "Por favor, tens de ler isto; isso é crescimento; isso é importante; isso não é importante; isto é vital para a tua vida; isto não é vital para a tua vida". Mas posso olhar para algo e sentir desejo, e tudo terminar ali, sem a interferência do pensamento.'
    ],
  ),
  Reflection(
    id: '97',
    title: 'Morrer para as Pequenas Coisas',
    day: 7,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.desejo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Já alguma vez tentaram morrer voluntariamente para um determinado prazer, sem ser de forma forçada? Normalmente, quando morremos, isso acontece contra a nossa vontade; a morte chega e leva-nos; não é um ato voluntário, exceto no caso do suicídio. Mas já alguma vez tentaram morrer voluntariamente, com facilidade, sentindo o abandono do prazer? É óbvio que não! No presente, os vossos ideais, os vossos prazeres, as vossas ambições são as coisas que lhes dão o assim chamado significado. A vida é viver, é abundância, plenitude, abandono, não um sentimento de que o eu tem importância. Isso é um mero fruto do intelecto. Se experimentarem morrer para as pequenas coisas, isso já é suficientemente bom. Apenas morrer para os pequenos prazeres, com facilidade, confortavelmente, com um sorriso, é suficiente, porque então perceberão que a vossa mente é capaz de morrer para muitas coisas, para todas as memórias. As máquinas estão a apropriar-se das funções da memória, os computadores, mas a mente humana é algo mais do que um mero hábito mecânico de associação e memória. Mas não poderá ser esse algo mais se não morrer para tudo o que conhece. Agora, para ver a verdade de tudo isto, é essencial uma mente jovem, uma mente que não está apenas a funcionar no campo do tempo. A mente jovem morre para todas as coisas. São capazes de ver a verdade disto de forma imediata, de sentir a verdade disto instantaneamente? Pode acontecer que não vejam a totalidade da sua extraordinária importância, a imensa sutileza, a beleza desse morrer, a sua riqueza, mas até mesmo o mero fato de ouvirem falar disso já planta a semente, e o significado destas palavras cria raízes, não apenas a um nível superficial, consciente, mas também ao nível do próprio inconsciente.'
    ],
  ),
  Reflection(
    id: '98',
    title: 'Sexo',
    day: 8,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O sexo é um problema, porque no ato sexual parece verificar-se uma completa ausência do eu. Nesse momento vocês estão felizes, porque cessa a autoconsciência, a consciência do eu; e ao desejarem que isso se repita, essa abnegação do eu na qual existe uma felicidade completa, sem passado e sem futuro, ao exigirem essa felicidade completa que se dá através da fusão total, da integração, é natural que este aspecto assuma uma importância preponderante. Não é assim? Porque se trata de algo que me transmite uma alegria que não é adulterada, um completo esquecimento de mim mesmo, quero cada vez mais e mais repetir esse prazer. Agora, por que quero eu mais? Porque em tudo o resto me encontro em conflito, em tudo o resto, em todos os diferentes níveis da existência se verifica o fortalecimento do eu. No campo econômico, social, religioso, há um constante adensar da autoconsciência, e isso é conflito. Afinal, só se está consciente de si mesmo quando existe conflilo. A consciência de si mesmo é, na sua própria essência, o resultado do conflito. Portanto, o problema não é o sexo, certamente, mas como ficarmos livres do eu. Já provaram esse estado de ser no qual o eu não está presente, nem que tenha sido apenas por alguns segundos por um dia, ou o que quer que tenha sido; e onde está o eu, há conflito, há sofrimento, há luta. Assim, há um desejo constante de repetir esse estado de ausência do eu.'
    ],
  ),
  Reflection(
    id: '99',
    title: 'A Maior Fuga',
    day: 9,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O que queremos diZer com o problema do sexo? Será que nos referimos ao ato, ou será um pensamento acerca do ato? Certamente, não se trata do ato. O ato sexual não é para vós um problema, tal como comer também não o é, mas se vocês se puserem a pensar na comida durante todo o dia, porque não têm mais nada em que pensar, então isso torna-se um problema para vós. Por que o empolam? Os cinemas, as revistas, as histórias, a forma como as mulheres se vestem, tudo contribui para alimentar os vossos pensamentos a respeito do sexo. E por que é que a mente os empola, por que é que a mente pensa em sexo de todo? Porquê, minhas senhoras e meus senhores? É o vosso problema. Porquê? Por que se tornou o sexo um assunto fulcral na vossa vida? Quando existem tantas coisas que vos chamam, que exigem a vossa atenção, vocês dão total atenção ao pensamento do sexo. O que se passa? Por que está a vossa mente de tal forma ocupada com ele? Porque essa é a maior forma de fuga, não é verdade? É uma forma de total esquecimento de si mesmo. Por algum tempo, pelo menos nesse momento, podem esquecer-se de si próprios, e não existe nenhum outro modo de isso acontecer. Tudo o resto que fazem na vida dá ênfase ao "eu". O vosso negócio, a vossa religião, os vossos deuses, os vosso líderes, as vossas ações políticas e econômicas, as vossas fugas, as vossas atividades sociais, a vossa escolha de um partido e rejeição de outro, tudo isso enfatiza e fortalece o "eu". Quando existe apenas uma coisa na vossa vida que constitui uma avenida para a maior fuga, para o completo esquecimento de si próprios, ainda que apenas por alguns segundos, vocês agarram-se a ela com todas as vossas forças, porque esse é o único momento em que estão felizes. Assim, o sexo transforma-se num problema extraordinariamente difícil e complexo que perdurará enquanto não compreenderem a mente que pensa no problema.'
    ],
  ),
  Reflection(
    id: '100',
    title: 'Fizemos do Sexo um Problema',
    day: 10,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Por que será que transformamos tudo aquilo em que tocamos num problema? Por que se tornou o sexo um problema? Por que nos submetemos a viver com problemas; por que não lhes pomos um fim?Por que não morremos para os nossos problemas em vez de os carregarmos às costas dia após dia, ano após ano? Certamente o sexo é uma questão relevante a que irei responder já a seguir, mas há uma questão primordial: por que fazemos da vida um problema? O trabalho, o sexo, o ganhar dinheiro, pensar, sentir, experimentar, estão a ver, todo o processo de viver, por que é que ele é um problema? Não será, essencialmente, porque pensamos sempre a partir de um determinado ponto de vista, de um ponto de vista fixo? Estamos sempre a pensar a partir de um centro para a periferia, mas a periferia é o centro para a maioria de nós, e portanto tudo aquilo em que tocarmos é superficial. Mas a vida não é superficial; ela exige que se viva de forma completa, e pelo fato de estarmos a viver apenas superficialmente, conhecemos apenas a reação superficial. O que quer que façamos na periferia irá, inevitavelmente, criar um problema, e isso é a nossa vida, vivemos a um nível superficial e estamos contentes de viver assim, com todos os problemas do superficial. Portanto, os problemas existem enquanto vivemos no superficial, na periferia, sendo a periferia o "eu" e as suas sensações, que podem ser exteriorizadas ou tornadas subjetivas, que se podem identificar com o universo, com o país, ou com qualquer outra coisa inventada pela mente. Assim, enquanto vivermos no campo da mente, terá de haver sempre complicações, problemas, e isso é tudo o que conhecemos.'
    ],
  ),
  Reflection(
    id: '101',
    title: 'O Que Entendem por Amor?',
    day: 11,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O amor é o incognoscível. Só pode ser apercebido quando o conhecido é compreendido e transcendido. Só quando a mente está livre do conhecido, só então haverá amor. Portanto, devemos começar por abordar a questão do amor pela negativa e não pela positiva. O que é o amor para a maioria de nós? No nosso caso, quando amamos, existe posse, domínio ou subserviência. Deste sentimento de posse nascem o ciúme e o medo da perda, e nós legalizamos este instinto possessivo. Com a posse, surgem o ciúme e os inúmeros conflitos com os quais cada um de nós está familiarizado. Portanto, a posse não é amor. Nem o amor é sentimental. Ser sentimental, ser emocional exclui o amor. O sentimentalismo e as emoções são meras sensações. Só o amor pode transformar a insanidade, a confusão e a luta. Nenhum sistema, nenhuma teoria de esquerda ou de direita pode trazer a paz e a felicidade à humanidade. Onde há amor, não há sentimento de posse, não há inveja; há misericórdia e compaixão, não em teoria mas efetivamente, pela vossa mulher e pelos vossos filhos, pelo vosso vizinho e pelo vosso empregado. Só o amor pode fazer nascer a misericórdia e a beleza, a ordem e a paz. Existe amor e todas as suas bênçãos quando "vocês" deixam de existir.'
    ],
  ),
  Reflection(
    id: '102',
    title: 'Enquanto Possuirmos Nunca Poderemos Amar',
    day: 12,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Conhecemos o amor enquanto sensação, não é verdade? Quando dizemos que amamos, conhecemos o ciúme, conhecemos o medo, a ansiedade. Quando vocês dizem que amam alguém, tudo isto está implicado: a inveja, o desejo de possuir, o desejo de ter, de dominar, o medo da perda, e assim por diante. A tudo isto chamamos nós amor, e não conhecemos o amor que não vem acompanhado pelo medo, pela inveja, pela posse; apenas verbalizamos esse estado de amor a que é alheio o medo, chamamos-lhe impessoal, puro, divino, ou sabe Deus mais o quê; mas o fato é que somos ciumentos, somos dominadores, possessivos. Só poderemos conhecer esse estado de amor quando cessar em nós o ciúme, a inveja, o sentimento de posse, o domínio; e enquanto possuirmos, nunca poderemos amar. Quando é que vocês pensam na pessoa que amam? Pensam nela quando ela está ausente, quando está longe, quando vos deixou. Portanto, vocês sentem falta da pessoa que dizem que amam quando estão de alguma forma perturbados, quando estão a sofrer; e enquanto vocês possuírem essa pessoa, não tem de pensar nela, porque na posse nada vos está a perturbar. .O pensamento surge quando estão perturbados, e vocês estão condenados a esse estado de perturbação enquanto o vosso pensamento for aquilo a que vocês chamam amor. Certamente o amor não é uma coisa da mente; e como as coisas da mente têm preenchido os nossos corações, não temos amor. As coisas da mente são o ciúme, a inveja, a ambição, o desejo de ser alguém, de ter sucesso. Estas coisas da mente preenchem os vossos corações, e então vocês dizem que amam; mas como é possível que amem se têm todos estes elementos confusos em vós? Quando há fumo, como é possível que haja uma chama pura?'
    ],
  ),
  Reflection(
    id: '103',
    title: 'O Amor não É um Dever',
    day: 13,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Quando há amor, não há nenhum dever. Quando vocês amam a vossa mulher, partilham tudo com ela, os vossos bens, os vossos problemas, a vossa ansiedade, a vossa alegria. Não exercem domínio sobre ela. Não são o homem e ela a mulher que é usada e colocada de lado, uma espécie de máquina reprodutora que dará continuação ao vosso nome. Quando existe amor, a palavra dever desaparece. É o homem que não tem amor no seu coração que fala de direitos e deveres, e neste país os deveres e os direitos tomaram o lugar do amor. As regulamentações tornaram-se mais importantes do que a ternura da afeição. Quando há amor, o problema é simples; quando não há amor, o problema torna-se complexo.  Quando um homem ama a sua mulher e os seus filhos, ele nunca será capaz de pensar em termos de dever e de direitos. Senhores, examinem os vossos próprios corações e as vossas próprias mentes. Sei que se vão rir disto, esse é um dos truques de quem é pouco refletido, rir-se de algo e pô-lo de lado. A vossa mulher não partilha da vossa responsabilidade, não partilha dos vossos bens, ela não detém metade de tudo o que vocês possuem, porque a consideram inferior a vós mesmos, algo que deve ser conservado e usado em termos sexuais a vosso bel-prazer. Portanto vocês inventaram as palavras direitos e obrigações; e quando as mulheres se rebelam, vocês atiram-lhes com estas palavras. É uma sociedade estática, uma sociedade em deterioração, aquela que fala de dever e de direitos. Se examinarem os vossos corações e as vossas mentes com toda a atenção, descobrirão que não têm amor.'
    ],
  ),
  Reflection(
    id: '104',
    title: 'Uma Coisa da Mente',
    day: 14,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Aquilo a que chamamos o nosso amor é algo que pertence à mente. Olhem para vós mesmos, senhoras e senhores, e verão que o que estou a dizer é uma verdade óbvia; se assim não fosse, a nossa vida, o nosso casamento, os nossos relacionamentos, seriam inteiramente diferentes, teríamos uma nova sociedade. Nós amarramo-nos a outra pessoa, não através da fusão, mas do contrato, a que se chama amor, casamento. O amor não funde, não ajusta, não é nem pessoal nem impessoal, é um estado de ser que a mente não pode descobrir; ela pode descrevê-lo, atribuir-lhe um termo, um nome, mas a palavra, a descrição, não é o amor. Só a mente que está tranquila pode conhecer o amor, e esse estado de tranquilidade não é algo que possa ser cultivado.'
    ],
  ),
  Reflection(
    id: '105',
    title: 'A Respeito do Casamento',
    day: 15,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Estamos a tentar compreender a questão do casamento, a qual implica o relacionamento sexual, o amor, o companheirismo, a co­munhão. É óbvio que se não houver amor, o casamento se transforma numa desgraça, não é verdade? Nesse caso transforma-se em mera gratificação. Amar é uma das coisas mais difíceis, não é? O amor só pode surgir, só pode existir quando o eu está ausente. Sem amor, o relacionamento é uma dor; seja ele gratificanle ou superficial, conduzirá ao tédio, à rotina, ao hábito com todas as suas implicações. Então, os problemas sexuais ganham uma importância fundamental. Quando tomamos em consideração o casamento, quer seja necessário ou não, temos primeiramente de compreender o amor. Certamente o amor é casto; vocês podem ser celibatários, quer sejam homem ou mulher, mas isso não é ser casto, isso não é ser puro, se não houver amor. Se vocês tiverem um ideal de castidade, ou seja, se vocês desejarem tornar-se castos, não existe nessa vossa atitude nenhum amor, porque se trata meramente do desejo de virem a ser algo que vocês consideram que é nobre, que pensam que vos ajudará a encontrar a realidade; não há nenhum amor nisso. A licenciosidade não é casta, apenas conduz à degradação, ao sofrimento. O mesmo acontece com a perseguição de um ideal. Ambos excluem o amor, ambos implicam o vir a ser algo, o entregar-se a algo; e portanto vocês tornam-se importantes, e onde vocês são importantes, o amor não é.'
    ],
  ),
  Reflection(
    id: '106',
    title: 'O Amor É Incapaz de Ajustamentos',
    day: 16,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.casamento,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'O amor não é uma coisa da mente, ou é? O amor não é meramente o ato sexual, ou é? O amor é algo que a mente não é capaz de conceber. O amor é algo que não pode ser formulado. E sem amor, vocês entram em relação; sem amor vocês casam. Então, nesse casamento, vocês "ajustam-se" um ao outro. Que bela frase! Ajustam-se um ao outro, o que é, mais uma vez, um processo intelectual, não é assim? É óbvio que este ajuste é um processo mental. Todos os ajustamentos o são. Mas, o amor é certamente incapaz de ajustamento. Vocês sabem, não é verdade, meus senhores, que quando se ama outra pessoa, não há qualquer "ajustamento". Há apenas uma completa fusão. Só quando não existe amor é que começamos a ajustar-nos. E este ajustamento é chamado casamento. Daí que o casamento falhe, porque ele é a própria fonte de conflito, uma batalha entre duas pessoas. Trata-se de um problema extraordinariamente complexo, como todos os problemas, mas ainda mais, uma vez que os apetites, os impulsos são tão fortes. Assim, uma mente que está apenas a tentar ajustar-se, nunca poderá ser casta. Uma mente que busca a felicidade através do sexo nunca poderá ser casta. Embora possam ter momentaneamente, nesse ato, auto-abnegação, auto-esquecimento, a própria procura dessa felicidade, que pertence ao domínio da mente, torna a mente impura. A castidade só pode surgir quando existe amor.'
    ],
  ),
  Reflection(
    id: '107',
    title: 'Amar É Ser Casto',
    day: 17,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Este problema do sexo não é simples e não pode ser resolvido apenas ao seu nível. Tentar resolvê-lo em termos puramente biológicos é absurdo; e abordá-lo por meio da religião ou tentar solucioná-lo como se ele fosse apenas uma questão de ajustamento físico, de ação glandular, ou cercá-lo de tabus e condenações é algo completamente imaturo, infantil e estúpido. Este problema exige ser tratado ao mais alto nível da inteligência. Compreendermo-nos na nossa relação com o outro requer uma inteligência muito mais flexível e sutil do que compreender a natureza. Mas nós procuramos compreender sem usarmos a inteligência; queremos a ação imediata, uma solução imediata, e assim o problema vai-se tornando cada vez mais importante. O amor não é mero pensamento; os pensamentos são somente a ação exterior do cérebro. O amor é muito mais profundo e a profundidade da vida só pode ser descoberta no amor. Sem amor, a vida não tem qualquer significado, e essa é a parte triste da nossa existência. Envelhecemos sem nos tornarmos mais maduros; os nossos corpos envelhecem, engordam e perdem a sua beleza, e nós permanecemos irrefletidos. Embora leiamos e conversemos sobre isso, nunca chegamos a conhecer o perfume da vida. A mera leitura, a mera verbalização, indica uma grande falta da ternura de coração que enriquece a vida; e sem essa qualidade de amor, façam vocês o que fizerem, qualquer que seja a sociedade a que se liguem, qualquer que seja a lei que consigam instaurar, não conseguirão resolver este problema. Amar é ser casto. O mero intelecto não é castidade. O homem que tenta ser casto em pensamento é impuro, porque não tem amor. Só o homem que ama é casto, puro, incorrupto.'
    ],
  ),
  Reflection(
    id: '108',
    title: 'O Pensamento Constante É uma Perda de Energia',
    day: 18,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A maioria de nós gasta a vida em esforço, em guerra, e o esforço, a luta é uma dissipação de energia. O homem, ao longo do período histórico da humanidade, tem dito que para encontrar essa realidade que é Deus, qualquer que seja o nome que ele lhe atribui, se tem de ser celibatário; ou seja, toma-se um voto de castidade e suprime-se, controla-se, luta-se consigo mesmo interminavelmente o resto da vida, para se manter o voto. Vejam a perda de energia! É também uma perda de energia permanecermos deleitados neste problema. E ele é investido de uma importância maior quando tentamos suprimi-lo. O esforço exigido pela supressão, pelo controlo, pela negação do desejo distorce a mente, e, através dessa distorção, temos uma certa sensação de austeridade que se torna cruel. Por favor, prestem atenção. Observem isto em vós próprios e observem as pessoas à vossa volta. E observem este desperdício de energia, a luta. Não as implicações do sexo, não o ato em si, mas os ideais, as imagens, o prazer, o pensar constantemente neles é uma perda de energia. E a maioria das pessoas gasta a sua energia ou na negação do sexo, ou através do voto de castidade, ou a pensarem continuamente nele.'
    ],
  ),
  Reflection(
    id: '109',
    title: 'O Idealista Não Pode Conhecer o Amor',
    day: 19,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Aqueles que tentam ser celibatários de modo a alcançarem Deus são impuros, porque buscam um resultado ou um ganho, substituindo assim o fim, o resultado pelo sexo, o que é medo. Os seus corações não têm amor, e neles não pode haver pureza, e só um coração puro pode encontrar a realidade. Um coração disciplinado, um coração suprimido, não pode saber o que é o amor. Ele não pode conhecer o amor se estiver aprisionado ao hábito, pela sensação, religiosa ou física, psicológica ou sensorial. O idealista é um imitador e como tal não pode conhecer o amor. Ele não pode ser generoso, entregar-se completamente sem pensar em si mesmo. Só quando a mente e o coração se encontram libertos do fardo do medo, da rotina dos hábitos sensoriais, quando existe generosidade e compaixão, é que pode haver amor. Um tal amor é casto.'
    ],
  ),
  Reflection(
    id: '110',
    title: 'Compreender a Paixão',
    day: 20,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Será que quando nos estamos a punir a nós mesmos isso significa que estamos a levar uma vida religiosa? Será a mortificação do corpo ou da mente um sinal de compreensão? Será que a tortura sobre si mesmo é um caminho para a realidade? Será que a castidade é uma negação? Pensam que podem ir longe por meio da renúncia? Pensam realmente que pode haver paz através do conflito?  Não será que os meios importam infinitamente mais do que os fins? O fim poderá vir a ser, mas o meio já é. A realidade, o que é, deve ser compreendida e não suavizada através de determinações, ideais, e racionalizações astuciosas. A tristeza não é a forma da felicidade. Aquilo a que se chama paixão tem de ser compreendido, e não suprimido ou sublimado, e não é nada bom arranjar um substituto para ela. O que quer que façam, qualquer que seja o esquema que possam inventar, só servirá para fortalecer aquilo que não foi amado e compreendido. Amar aquilo a que chamamos paixão é compreendê-lo. Amar é estar em comunhão direta; e não se pode amar algo se sentirmos ressentimentos, se tivermos ideias, conclusões acerca desse algo. Como se pode amar e compreender a paixão se se tomou um voto contra ela? Um voto é uma forma de resistência, e aquilo a que resistimos acaba por nos conquistar. A verdade não pode ser conquistada; não se pode assaltá-la; ela escapar-nos-á das mãos se a tentarmos agarrar. A verdade vem silenciosamente, sem que o saibamos. Aquilo que sabemos não é a verdade, é apenas uma ideia, um símbolo. A sombra não é o real.'
    ],
  ),
  Reflection(
    id: '111',
    title: 'Os Meios e o Fim São Um Só',
    day: 21,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.sexo,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para se atingir a libertação, nada é necessário. Não se consegue alcançá-la por meio de negociações, do sacrifício, da eliminação; não se trata de algo que se possa comprar. Se fizermos estas coisas, apenas conseguiremos algo do mercado, e portanto, irreal. A verdade não pode ser comprada, não existem meios para se alcançar a verdade; se houver um meio, então o fim não é a verdade, porque os meios e o fim são um só, eles não estão separados. A castidade como um meio para a libertação, para a verdade, é uma negação da verdade. A castidade não é uma moeda com a qual se pode comprar a verdade. Por que achamos que a castidade é essencial? O que entendemos por sexo? Não me refiro apenas ao ato, mas ao pensar nele, á forma como o sentimos, como o antecipamos, como lhe escapamos — este é o nosso problema. O nosso problema é a sensação, o querermos mais e mais. Olhem para vós mesmos, não para o vosso vizinho. Por que estão os vossos pensamentos tão ocupados com o sexo? A castidade só pode existir quando há amor, e sem amor não há castidade. Sem amor, a castidade é apenas luxúria sob uma outra forma. Tornar-se casto é tornar-se algo de diferente disso; é como um homem que se está a tornar poderoso, a ter sucesso como advogado, ou político, ou o que quer que seja — a mudança opera-se ao mesmo nível. Isso não é castidade, mas apenas o resultado final de um sonho, o resultado de uma resistência continuada em relação a um determinado desejo. Portanto, onde existe amor, a castidade deixa de ser um problema. Então a vida não é um problema, a vida é para ser vivida de forma completa na plenitude do amor, e essa revolução dará origem a um mundo novo.'
    ],
  ),
  Reflection(
    id: '112',
    title: 'Abandono Total',
    day: 22,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Talvez vocês nunca tenham experimentado aquele estado da mente em que existe um abandono total de tudo, um completo deixar ir. E não se consegue abandonar tudo sem uma paixão profunda, não é assim? Não se pode abandonar tudo intelectualmente ou emocionalmente.\n\Certamente só pode haver um abandono total quando existe a paixão intensa. Não fiquem alarmados com essa palavra, porque um homem que não é apaixonado, que não é intenso, nunca poderá compreender ou sentir a qualidade da beleza. A mente que tem algo de reserva, que tem um interesse adquirido, que se agarra à posição, ao poder, ao prestígio, a mente que é respeitável, o que é um horror — uma tal mente nunca se consegue abandonar.'
    ],
  ),
  Reflection(
    id: '113',
    title: 'Esta Chama Pura da Paixão',
    day: 23,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Na maioria de nós existe muito pouca paixão. Podemos ser voluptuosos, podemos estar a desejar algo, podemos querer escapar a algo, e tudo isto dá-nos realmente uma certa intensidade. Mas a menos que acordemos e que sintamos qual é o nosso caminho até essa chama da paixão sem causa, não seremos capazes de compreender aquilo a que chamamos tristeza. Para compreendermos algo, temos de ter paixão, a intensidade da atenção completa. Onde existe a paixão por algo que produz contradição, conflito, esta pura chama da paixão não pode existir; e esta pura chama da paixão tem de existir para que a tristeza possa terminar, para que possa ser completamente dissipada.'
    ],
  ),
  Reflection(
    id: '114',
    title: 'Beleza para Além do Sentimento',
    day: 24,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Como pode haver beleza sem paixão? Não me refiro à beleza dos quadros, dos edifícios, das mulheres maquilhadas, e de tudo o resto. Eles têm a sua forma própria de beleza. Algo que foi construído pelo homem, como uma catedral, um templo, um quadro, um poema ou uma estátua pode ser ou não bonito. Mas existe uma beleza que está para além do sentimento e do pensamento e que não pode ser percebida, compreendida ou conhecida se não houver paixão. Portanto não interpretem mal a palavra paixão. Não é uma palavra feia; não é algo que se possa comprar no mercado ou sobre a qual se possa falar em termos românticos. Não tem absolutamente nada que ver com a emoção, o sentimento. Não é uma coisa respeitável; é uma chama que destrói tudo aquilo que é falso. E nós temos sempre tanto medo de permitir que essa chama devore as coisas de que gostamos, as coisas a que chamamos importantes.'
    ],
  ),
  Reflection(
    id: '115',
    title: 'Paixão por Tudo',
    day: 25,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Para a maior parte de nós, a paixão só é empregue em relação a uma coisa, o sexo; ou então sofre-se apaixonadamente e tenta-se resolver esse sofrimento. Mas eu estou a utilizar a palavra paixão no sentido de um estado da mente, um estado de ser, um estado do vosso âmago, se houver uma tal coisa, que sente de forma muito intensa, que é altamente sensível — igualmente sensível à sujidade, à sordidez, à pobreza e às maiores riquezas e corrupção, à beleza de uma árvore, de um pássaro, ao fluir de um curso de água e a um lago onde se reflete o céu estrelado. É necessário sentir tudo isto com intensidade, com força. Porque sem paixão, a vida torna-se vazia, rasteira e com muito pouco significado. Se vocês nao forem capazes de ver a beleza de uma árvore, de a amarem, de não conseguirem gostar dela intensamente, não estarão a viver.'
    ],
  ),
  Reflection(
    id: '116',
    title: 'O Amor, Posso Assegurar-vos, É Paixão',
    day: 26,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Não podemos ser sensíveis se não formos apaixonados. Não tenham medo da palavra paixão. A maior parte dos livros religiosos, dos gurus, dos swamis, dos líderes, e de todas essas pessoas dizem: "Não sintam paixão". Mas se vocês não tiverem paixão, como poderão ser sensíveis ao que é feio, ao que é bonito, às folhas que sussurram, ao pôr-do-sol, a um sorriso, a uma lágrima? Como poderão ser sensíveis sem um sentimento de paixão no qual haja abandono? Meus senhores, por favor escutem-me, e não comecem a perguntar de que modo é que se consegue sentir paixão. Sei que são todos suficientemente apaixonados quando se trata de conseguir um bom emprego, ou de odiar um desgraçado qualquer, ou de sentir ciúmes ou inveja de alguém; mas eu estou a falar de algo que é inteiramente diferente, uma paixão que ama. O amor é um estado no qual não existe "eu"; o amor é um estado no qual não existe qualquer condenação, nada que diga que o sexo é certo ou errado, que isto é bom e que uma outra coisa qualquer é má. O amor não é nenhuma destas coisas contraditórias. No amor não existe contradição. E como poderemos amar se não formos apaixonados? Sem paixão, como poderemos ser sensíveis? Ser sensível é sentir o nosso vizinho sentado ao nosso lado; é ver a fealdade da cidade com a sua sordidez, a sua enorme sujidade, a sua pobreza, e ver a beleza do rio, do mar, do céu. Se vocês não forem apaixonados, como poderão ser sensíveis a tudo isso? Como poderão sentir um sorriso, uma lágrima? O amor, posso assegurar-vos, é paixão.'
    ],
  ),
  Reflection(
    id: '117',
    title: 'Uma Mente Apaixonada Investiga',
    day: 27,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'É óbvio que tem de haver paixão, e a questão é como fazer renascer essa paixão. Vamos tomar cuidado para que não haja aqui nenhum mal-entendido. Refiro-me à paixão no sentido mais lato, e não apenas à paixão sexual, que é algo muito pequeno. E a maioria de nós fica satisfeita com isso, porque todas as outras paixões foram destruídas, no escritório, na fábrica, no ato de seguir determinada carreira, determinada rotina, de aprender certas técnicas, e assim não resta nenhuma paixão; não existe nenhum sentido criativo de urgência e de libertação. E assim, o sexo torna-se importante para nós, e então perdemo-nos numa paixão insignificante que se torna um problema enorme para a mente estreita e virtuosa, ou então, em breve se transforma num hábito e morre. Estou a usar a palavra paixão como uma coisa total e completa. Um homem apaixonado que sente de forma intensa não se satisfaz somente com um pequeno emprego, seja esse emprego o de primeiro-ministro, cozinheiro, ou o que for. Uma mente que é apaixonada investiga, procura, olha, pergunta, exige, sem estar apenas a tentar encontrar para seu descontentamento um objeto no qual possa preencher-se e ir dormir. Uma mente apaixonada experimenta, procura, entra em ruptura, não aceita nenhuma tradição; não é uma mente que já esteja decidida, que já tenha chegado, mas sim uma mente jovem que está sempre a chegar.'
    ],
  ),
  Reflection(
    id: '118',
    title: 'A Mente Mesquinha',
    day: 28,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'Uma mente apaixonada experimenta, procura, entra em ruptura, sem aceitar nenhuma tradição; não é uma mente que já esteja decidida, que já tenha chegado, mas sim uma mente jovem que está sempre a chegar. Agora, como é que se pode ter uma mente assim? Tem de acontecer. É óbvio que uma mente mesquinha não se consegue transformar numa mente assim. Uma mente mesquinha a tentar tornar-se apaixonada apenas conseguirá reduzir tudo à sua própria mesquinhez. Tem de acontecer, e só poderá acontecer quando a mente observa a sua própria pequenez e ainda assim não tenta fazer nada acerca disso. Estou a ser claro? Provavelmente não estou. Mas tal como disse anteriormente, qualquer mente limitada, embora possa ser muito impetuosa, continuará a ser mesquinha, e isso por certo que é óbvio. Uma mente pequena, embora possa chegar á lua, embora possa aprender determinada técnica, embora possa argumentar e defender com inteligência, continua a ser uma mente pequena. Portanto, quando a mente pequena diz: "Devo ser apaixonada para poder fazer algo que valha a pena", é óbvio que a sua paixão será muito mesquinha, não acham? Como por exemplo zangar-se por causa de uma pequena injustiça ou pensar que o mundo inteiro está a mudar devido a uma reforma pequena e insignificante levada a cabo numa cidade pequenina, por uma mente pequenina. Se a mente pequena for capaz de ver tudo isso, então essa mesma percepção provocará uma mudança em toda a sua atividade.'
    ],
  ),
  Reflection(
    id: '119',
    title: 'Paixão Perdida',
    day: 29,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'A palavra não é a coisa. A palavra paixão não é a paixão. Sentir isso e ser apanhado nisso sem qualquer volição, ou diretiva, ou propósito, ouvir esta coisa chamada desejo, ouvir os vossos próprios desejos — e vocês têm muitos desejos, ténues ou intensos — quando forem capazes de o fazer, poderão perceber o prejuizo que causam quando suprimem o desejo, quando o distorcem, quando o querem satisfazer, quando querem fazer algo acerca dele, quando têm uma opinião acerca dele. A maior parte das pessoas perdeu esta paixão. É provável que a tenham tido na juventude — tornar-se um homem rico, ser famoso e viver uma vida burguesa e respeitável — talvez algo vagamente semelhante a isso. E a sociedade, que é aquilo que vocês forem, suprime isso. E portanto uma pessoa tem de se ajustar a vós, que estão mortos, que são respeitáveis, que não têm sequer uma centelha de paixão; e então uma pessoa torna-se parte de vós e, ao fazê-lo, perde esta paixão.'
    ],
  ),
  Reflection(
    id: '120',
    title: 'Paixão sem Causa',
    day: 30,
    month: Months.abril,
    monthFilters: ['abr'],
    tag: Tags.paixao,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      'No estado de paixão sem causa há uma intensidade livre de qualquer apego; mas quando a paixão tem uma causa, há apego, e o apego é o princípio da tristeza. A maioria de nós está apegada, agarramo-nos a uma pessoa, a um país, a uma crença, a uma ideia, e quando o objeto do nosso apego nos é retirado ou perde de alguma outra forma a sua importância, damos por nós vazios, insuficientes. Então tentamos preencher este vazio agarrando-nos a outra coisa, a qual se torna, mais uma vez, o objeto da nossa paixão. Examinem os vossos próprios corações e as vossas próprias mentes. Eu sou apenas um espelho no qual vocês se vêem a vós mesmos. Se não se quiserem ver, não tem importância; mas se quiserem realmente ver-se, então olhem para vós mesmos com clareza, diretamente, com intensidade, não na esperança de assim dissolverem as vossas infelicidades, as vossas ansiedades, o vosso sentimento de culpa, mas para que possam compreender esta paixão extraordinária que invariavelmente conduz à tristeza. Quando a paixão tem uma causa, transforma-se em luxúria. Quando existe paixão por algo, por uma pessoa, por uma ideia, por algum tipo de preenchimento, então a partir dessa paixão nasce a contradição, o conflito, o esforço. Vocês lutam por alcançar ou por manter um determinado estado, ou por recuperar um que já sentiram e desapareceu. Mas a paixão de que estou a falar não dá origem à contradição, ao conflito. Não está relacionada com nenhuma causa, e portanto não é um efeito.'
    ],
  ),
  /* Maio: Inteligência, Sentimentos, Palavras e Condicionamento Pag.: 135
     inclusao dias 28 a 30 de abril
 */
  /* 
  Reflection(
    id: '1',
    title: '',
    day: 1,
    month: Months.janeiro,
    monthFilters: ['jan'],
    tag: Tags.autoridade,
    imagePath: 'assets/images/calendar.jpg',
    paragraphs: [
      ''
    ],
  ),
  */
];
