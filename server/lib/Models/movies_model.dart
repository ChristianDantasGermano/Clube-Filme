import 'package:server/Models/cast_model.dart';
import 'package:server/Models/director_model.dart';
import 'package:server/Models/productionCompanies_model.dart';
import 'package:server/Models/productionCountries_models.dart';
import 'package:server/Models/video_model.dart';

class Movies {
  late String id;
  late String backdropPath;
  late String posterPath;
  late List<String> genres;
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late List<ProductionCompanies> productionCompanies;
  late List<ProductionCountries> productionCountries;
  late String releaseDate;
  late String status;
  late String tagline;
  late String title;
  late double voteAverage;
  late int voteCount;
  late int runtime;

  //Adicionado de forma manual
  late List<Cast> casts;
  late List<Video> video;
  late Director director;

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    backdropPath = json['backdrop_path'];
    posterPath = json['poster_path'];
    genres=[];
    for(var genero in json['genres']){
      genres.add(genero['name']);
    }
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        if (v['logo_path'] != null) {
          productionCompanies.add(ProductionCompanies.fromJson(v));
        }
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    runtime = json['runtime'];
  }
}
