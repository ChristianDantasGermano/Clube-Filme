//Biblioteca utilizada para requisição http.
import 'package:dio/dio.dart';
import 'package:server/Models/cast_model.dart';
import 'package:server/Models/director_model.dart';
import 'package:server/Models/movies_model.dart';

//Classe responsável por procura nos créditos de cada filmes diretor e atores, inserindo na classe filmes respectiva
class CreditsRepository {
  final _dio = Dio();

  Future<void> fetchCredits(List<Movies> movies) async {
    for (var movie in movies) {
      List<Cast> listCasts = [];
      final id = movie.id;
      //Procura os atores e diretores, adicionando nos filmes
      final responseCredits = await _dio.get(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=56c22279beda2d272cb2a9111761d64f&language=pt-br');

      //Selecionar autores e adicionar autores
      var count = 0;
      for (var data in responseCredits.data['cast']) {
        if (data['profile_path'] != null) {
          final cast = Cast.fromJson(data);
          listCasts.add(cast);
        }
        if(count >= 4){
         break;   
        }
        count++;
      }
      movie.casts = listCasts;
      //Selecionar diretores e adicionar diretor
      for (var data in responseCredits.data['crew']) {
        if (data['job'] == 'Director') {
          final director = Director.fromJson(data);
          movie.director = director;
        }
      }
    }
  }
}
