import 'package:server/Models/productionCompanies_model.dart';
import 'package:server/Models/video_model.dart';
import 'package:server/Repositories/credits_repository.dart';
import 'package:server/Repositories/movies_repository.dart';
import 'package:server/Repositories/video_repository.dart';

//Importações Firabase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Classe para passa todos dados da API para o banco
class SynchronizeRemoteRepository {
  
  Future<void> synchronize() async {
    //Iniciar comunicação com Firabase
    await Firebase.initializeApp();

    //Instânciar as coleções do firabase a serem usadas
    CollectionReference atoresRemote =
        FirebaseFirestore.instance.collection('Atores');
    CollectionReference diretorRemote =
        FirebaseFirestore.instance.collection('Diretores');
    CollectionReference moviesRemote =
        FirebaseFirestore.instance.collection('Filmes');

    //Instânciar batch para mutiplas escrita de uma vez
    WriteBatch batch = FirebaseFirestore.instance.batch();

    //Instanciar os Repository da API
    final repositoryMovie = MoviesRepository();
    final repositoryCredits = CreditsRepository();
    final repositoryVideos = VideosRepository();

    //Captura todos os dados da API e salvar localmente
    final movies = await repositoryMovie.fetchMovies();
    await repositoryCredits.fetchCredits(movies);
    await repositoryVideos.fetchVideos(movies);

    //Pegar filme por filme, e cadastrar no firabase todos os dados.
    for (var movie in movies) {
      //Listas a serem cadastradas no filme
      List listAtores = [];
      List listEstudio = [];
      List listVideo = [];
      List listGeneros = [];
      
      var imagem;
      var localizacao;

      //Pecorrer lista de atores no filme
      for (var ator in movie.casts) {
        //Cadastrar cada ator no firabase, no documento Atores mantendo o mesmo ID da API
        await atoresRemote
            .doc(ator.id)
            .set({
              "Imagem": ator.profilePath,
              "Nome": ator.name,
              "Popularidade": ator.popularity
            })
            .then((value) => print("Cadastrado ator com  sucesso"))
            .catchError((error) => print("Erro ao cadastrar ator"))
            .then((value) async {
              //Depois de todos os atores terem sidos cadastrados.
              //Capturar o endereço de referencia do documento do autor do filme
              await atoresRemote.doc(ator.id).get().then((value) {
                DocumentReference atorRef;
                atorRef = value.reference;
                //Cria a lista com referencias do documento de atores
                createListAtores(listAtores, atorRef, ator.character);
              });
            });
      }
      
      //Salvar estúdios na lista
      for(var estudio in movie.productionCompanies){
        createListEstudio(listEstudio, estudio);
      }

      //Salvar gêneros na lista
      for(var genero in movie.genres){
        createListGeneros(listGeneros, genero);
      }
      
      //Salvar vídeos na lista
      for(var video in movie.video){
        createListVideos(listVideo, video);
      }

      //Salvar imagem
      imagem = {
        "LinkBackground" : movie.backdropPath,
        "LinkCartaz" : movie.posterPath
      };

      //Salvar localização
      localizacao = {
        "Sigla" : movie.productionCountries[0].iso31661,
        "Nome" : movie.productionCountries[0].name
      };

      //Cadastrar o diretor se não existir
      DocumentReference directorRef;
      await diretorRemote
          .doc(movie.director.id)
          .set({
            "Imagem": movie.director.profilePath,
            "Nome": movie.director.name,
            "Popularidade": movie.director.popularity
          })
          .then((value) => print("Cadastrado diretor com  sucesso"))
          .catchError((error) => print("Erro ao cadastrar diretor"));

      await diretorRemote.doc(movie.director.id).get().then((value) {
        directorRef = value.reference;
        //Coloca o cadastro do filme na batch
        batch.set(moviesRemote.doc(movie.id), {
          "Atores": FieldValue.arrayUnion(listAtores),
          "DataLancamento": movie.releaseDate,
          "Duracao": movie.runtime,
          "Status": movie.status,
          "NotaUsuario": 0,
          "NotaCriticos": movie.voteAverage,
          "Popularidade": movie.popularity,
          "Sinopse": movie.overview,
          "Tagline": movie.tagline,
          "Titulo": movie.title,
          "Diretor": directorRef,
          "Estudios": FieldValue.arrayUnion(listEstudio),
          "Generos": FieldValue.arrayUnion(listGeneros),
          "Videos": FieldValue.arrayUnion(listVideo),
          "Imagen": imagem,
          "Localizacao": localizacao
        });       
      });

    }
    //Executa todos os cadastros de filme
    await batch
        .commit()
        .then((value) => print("Cadastrado filmes com  sucesso"))
        .catchError((onError) => print(onError));
  }

  //Listas 

  //Função para salvar atores no formato do documento no firabase
  void createListAtores(listAtores, ator, personagem) {
    listAtores.add({"Ator":  ator, "Nome": personagem});
  }

  void createListEstudio(listEstudio, ProductionCompanies estudio) {
    listEstudio.add({"Imagen": estudio.logoPath, "Nome": estudio.name});
  }
  void createListGeneros(listGeneros,String genero) {
    listGeneros.add({"genero": genero});
  }
  void createListVideos(listVideos,Video videos) {
    listVideos.add({"Link": videos.link, "Site": videos.site,"Tipo" : videos.type});
  }
}
