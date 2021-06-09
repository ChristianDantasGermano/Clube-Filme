class Movie {
  String imageUrl;
  String title;
  String categories;
  int year;
  String country;
  int length;
  String description;
  List<String> screenshots;
  List<String> photoActors;
  List<String> actors;
  List<String> comments;

  Movie({
    required this.imageUrl,
    required this.title,
    required this.categories,
    required this.year,
    required this.country,
    required this.length,
    required this.description,
    required this.screenshots,
    required this.photoActors,
    required this.actors,
    required this.comments,
  });
}

final List<Movie> movies = [
  Movie(
    imageUrl:
        'https://blogs.opovo.com.br/tomodachinerds/wp-content/uploads/sites/102/2020/01/Made-in-Abyss-740x521.jpg',
    title: 'Made in abyss',
    categories: 'Fantasia, Sci-fi',
    year: 2017,
    country: 'JP',
    length: 159,
    description:
        'Abyss, é assim que é conhecido um grande conjunto de carvernas inexplorado pela humanidade. Anos se passaram e ninguém conseguia desvendar o mistério acerca deste local, até que em Oosu, uma cidade à beira do abismo, surge alguém com a promessa de explorar a região. Trata-se de Riko (voz original de Miyu Tomita), uma corajosa garotinha órfã.',
    screenshots: [
      'https://images8.alphacoders.com/880/thumb-1920-880844.png',
      'https://images3.alphacoders.com/880/thumb-1920-880846.png',
      'https://images8.alphacoders.com/880/thumb-1920-880847.png',
    ],
    photoActors: [
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/tom-cruise-240x300.jpg',
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/cris-hemworth-300x300.jpg',
      'https://s2.glbimg.com/oohf2HDl2y8-oreMw2bX-3PAE4U=/e.glbimg.com/og/ed/f/original/2019/12/13/will-smith.jpg',
    ],
    actors: [
      'Tom Cruise',
      'Cris Hemworth',
      'Brad Pitt',
    ],
    comments: [
      'Uma qualidade muito grande, eu diria muito louco como as coisas terminand mais ta tudo bem belo então quem se importa :)',
      'Revoltante como tudo termina, mais o envolvimento da obra em te destruir de dentro para fora e sufocante, ao mesmo tempo muito gratificante.',
      'HAAAAAAAAA, estou incomodada como destruiram tanto uma obra ogirinalmente de umna qualidade impecavel caiu em um limpo horrivel.',
    ],
  ),
  Movie(
    imageUrl: 'https://i.ibb.co/LQGZ2hw/star-wars-the-rise-of-skywalker.jpg',
    title: 'Star Wars',
    categories: 'Adventura, Ação, Fantasia',
    year: 2013,
    country: 'USA',
    length: 122,
    description:
        'A princesa Leia é mantida refém pelas forças imperiais comandadas por Darth Vader. Luke Skywalker e o capitão Han Solo precisam libertá-la e restaurar a liberdade e a justiça na galáxia.',
    screenshots: [
      'http://complemento.veja.abril.com.br/entretenimento/a-forca-de-star-wars/img/abre.jpg',
      'https://ibcdn.canaltech.com.br/i4QE3PmQCcmMKsg9zuA7f-Kma7A=/141x0:2179x1148/512x288/smart/i381921.jpeg',
      'https://i0.wp.com/cloud.estacaonerd.com/wp-content/uploads/2020/12/08100641/lego-star-wars-especial-de-natal-ganha-trailer-e-data-de-estreia.jpg?fit=1500%2C844&ssl=1',
    ],
    photoActors: [
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/tom-cruise-240x300.jpg',
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/cris-hemworth-300x300.jpg',
      'https://s2.glbimg.com/oohf2HDl2y8-oreMw2bX-3PAE4U=/e.glbimg.com/og/ed/f/original/2019/12/13/will-smith.jpg',
    ],
    actors: [
      'Tom Cruise',
      'Cris Hemworth',
      'Brad Pitt',
    ],
    comments: [
      'Uma qualidade muito grande, eu diria muito louco como as coisas terminand mais ta tudo bem belo então quem se importa :)',
      'Revoltante como tudo termina, mais o envolvimento da obra em te destruir de dentro para fora e sufocante, ao mesmo tempo muito gratificante.',
      'HAAAAAAAAA, estou incomodada como destruiram tanto uma obra ogirinalmente de umna qualidade impecavel caiu em um limpo horrivel.',
    ],
  ),
  Movie(
    imageUrl: 'https://www.jornalbomdia.com.br/tb_noticias/35187/deadpool.jpg',
    title: 'Deadpool',
    categories: 'Adventura, Ação',
    year: 2018,
    country: 'USA',
    length: 134,
    description:
        'Wade Wilson é um ex-agente especial que passou a trabalhar como mercenário. Seu mundo é destruído quando um cientista maligno o tortura e o desfigura completamente. O experimento brutal transforma Wade em Deadpool, que ganha poderes especiais de cura e uma força aprimorada. Com a ajuda de aliados poderosos e um senso de humor mais desbocado e cínico do que nunca, o irreverente anti-herói usa habilidades e métodos violentos para se vingar do homem que quase acabou com a sua vida.',
    screenshots: [
      'http://3.bp.blogspot.com/-Eg2WCr1GBbQ/VcILT5lre9I/AAAAAAAALUo/Ua1TXV0aBPg/s1600/Screen%2BShot%2B2015-08-05%2Bat%2B8.50.13%2BAM.png',
      'https://rockinboys.com/wp-content/uploads/2016/02/Deadpool-Movie-Screenshot.jpg',
      'https://m.media-amazon.com/images/M/MV5BMzYyNjI0MzA3M15BMl5BanBnXkFtZTgwMDA3Nzc5NzE@._V1_.jpg',
    ],
    photoActors: [
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/tom-cruise-240x300.jpg',
      'https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/cris-hemworth-300x300.jpg',
      'https://s2.glbimg.com/oohf2HDl2y8-oreMw2bX-3PAE4U=/e.glbimg.com/og/ed/f/original/2019/12/13/will-smith.jpg',
    ],
    actors: [
      'Tom Cruise',
      'Cris Hemworth',
      'Brad Pitt',
    ],
    comments: [
      'Uma qualidade muito grande, eu diria muito louco como as coisas terminand mais ta tudo bem belo então quem se importa :)',
      'Revoltante como tudo termina, mais o envolvimento da obra em te destruir de dentro para fora e sufocante, ao mesmo tempo muito gratificante.',
      'HAAAAAAAAA, estou incomodada como destruiram tanto uma obra ogirinalmente de umna qualidade impecavel caiu em um limpo horrivel.',
    ],
  ),
];

final List<String> myList = [
  'https://static.wikia.nocookie.net/thebate/images/9/91/Volume2.jpg/revision/latest?cb=20200101085652',
  'https://static.wikia.nocookie.net/thebate/images/3/3b/Volume6.jpg/revision/latest?cb=20200101090043',
  'https://static.wikia.nocookie.net/thebate/images/9/91/Volume7.jpg/revision/latest?cb=20200212042250',
  'https://static.wikia.nocookie.net/thebate/images/e/e4/Volume4.jpg/revision/latest?cb=20200101085857',
  'https://i.ibb.co/RN0RSFn/The-beginning-After-The-end-light-novel-asuralightnovel-1.png',
];

final List<String> popular = [
  'https://http2.mlstatic.com/D_NQ_NP_855471-MLB26586465410_012018-O.jpg',
  'https://cdn.ome.lt/Z8uv4h9Sl9w4b4xJJDFySIDGBXA=/fit-in/1070x750/smart/filer_public/d7/2b/d72bb848-8dc5-49a2-98cc-580dea871592/avengers-infinity-war-poster.jpeg',
  'https://temperoalternativo.com.br/wp-content/uploads/2014/12/filmes-2150-cartazes-ratatouille_04.jpg',
  'https://ae01.alicdn.com/kf/HTB1.9.JOVXXXXbUXpXXq6xXFXXXr/Personalizado-Canvas-Art-Adesivos-de-Parede-M-dico-Doutor-Estranho-Estranho-Char-Cumberbatch-Cartaz-Papel-De.jpg',
  'https://cdn.ome.lt/NykVZENMchrm1rB0Aez6COd-mWI=/fit-in/1070x750/smart/filer_public/1a/c6/1ac6c906-bf2e-4c8a-8195-d2fcaaa47b5d/capita-marvel-poster-18-09.jpg',
];
