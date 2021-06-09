class Reviews {
  String name;
  String photo;
  String date;
  String score;
  String comments;

  Reviews({
    required this.name,
    required this.photo,
    required this.date,
    required this.score,
    required this.comments,
  });
}

final List<Reviews> reviews = [
  Reviews(
    name: 'Ferdinando Roconbolle',
    photo:
        'http://tendencee.com.br/wp-content/uploads/2018/09/3000-horas-depois-aqui-estao-mais-de-30-fotos-antigas-em-preto-e-branco-de-pessoas-famosas-que-eu-colei-XPdKqKZd0O.jpg',
    date: '12/03/2019',
    score: '10',
    comments:
        'Uma qualidade muito grande, eu diria muito louco como as coisas terminand mais ta tudo bem belo então quem se importa AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :)',
  ),
  Reviews(
    name: 'Susi Mineira',
    photo:
        'https://deveserisso.com.br/blog/wp-content/uploads/2016/02/coisas-incriveis-surpresa.jpg',
    date: '16/06/2020',
    score: '8.5',
    comments:
        'Revoltante como tudo termina, mais o envolvimento da obra em te destruir de dentro para fora e sufocante, ao mesmo tempo muito gratificante.',
  ),
  Reviews(
    name: 'Marcelina Nogueira',
    photo:
        'https://observatoriodocinema.uol.com.br/wp-content/uploads/2017/07/emma-watson.jpg',
    date: '26/02/2021',
    score: '2',
    comments:
        'HAAAAAAAAA, estou incomodada como destruiram tanto uma obra ogirinalmente de umna qualidade impecavel caiu em um limpo horrivel.',
  ),
  Reviews(
    name: 'teste',
    photo:
        'https://observatoriodocinema.uol.com.br/wp-content/uploads/2017/07/emma-watson.jpg',
    date: '26/02/2021',
    score: '2',
    comments: 'teste',
  ),
];
