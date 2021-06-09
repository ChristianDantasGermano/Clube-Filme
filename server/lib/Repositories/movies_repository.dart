//Biblioteca utilizada para requisição http.
import 'package:dio/dio.dart';
import 'package:server/Models/movies_model.dart';

class MoviesRepository {
    final _dio = Dio();
    final urlId = 'https://api.themoviedb.org/3/movie/popular?api_key=56c22279beda2d272cb2a9111761d64f&language=pt-br&page=1';

    Future<List<Movies>> fetchMovies() async {
      //Pegar uma lista de id de filmes
      final responseId = await _dio.get(urlId);
      final listAllMovies = responseId.data['results'];
      final listId = [];

      //Criar uma lista com id dos filmes
      for(var movie in listAllMovies){
        listId.add(movie['id']); 
      }
      //Usar o id de cada filmes, para  pegar todos os detalhes dos filmes necessários
      // ignore: omit_local_variable_types
      List<Movies> listMovies = [];
      for(var id in listId){
        final responseId = await _dio.get('https://api.themoviedb.org/3/movie/$id?api_key=56c22279beda2d272cb2a9111761d64f&language=pt-br');
        final movi = Movies.fromJson(responseId.data);
        listMovies.add(movi);
      }

      return listMovies;
    }
}