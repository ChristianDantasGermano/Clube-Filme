//Biblioteca utilizada para requisição http.
import 'package:dio/dio.dart';
import 'package:server/Models/movies_model.dart';
import 'package:server/Models/video_model.dart';

//Classe responsável por procura os videos, e adicionar aos filmes
class VideosRepository {
  final _dio = Dio();

  Future<void> fetchVideos(List<Movies> movies) async {
    for (var movie in movies) {
      // ignore: omit_local_variable_types
      List<Video> listVideos = [];
      final id = movie.id;
      //Procura os videos, adicionando nos filmes
      final responseVideos = await _dio.get(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=56c22279beda2d272cb2a9111761d64f&language=pt-br');

      //Selecionar video e adicionar
      for (var data in responseVideos.data['results']) {
        final video = Video.fromJson(data);
        listVideos.add(video);
      }
      movie.video = listVideos;
    }
  }
}
