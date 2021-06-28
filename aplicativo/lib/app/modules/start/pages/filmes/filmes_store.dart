import 'package:aplicativo/app/shared/firestore/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'filmes_store.g.dart';

class FilmesStore = _FilmesStoreBase with _$FilmesStore;

abstract class _FilmesStoreBase with Store {
  FirestoreController firestore = Modular.get();

  @observable
  ObservableList<Filme>? filmePage;

  @observable
  String? genero = "Ação";

  List<Filme> filmes = [];
  List<Filme> filmesGenero = [];

  _FilmesStoreBase() {
    filmes = firestore.filmesList!.data;
    atualiza();
  }

  @action
  reset() {
    print("Falta fazer");
  }

  @action
  getGenero() {
    return genero;
  }

  @action
  setGenero(String? value) {
    filmesGenero = [];
    genero = value;
    for (Filme fil in filmes) {
      for (var gen in fil.generos) {
        if (gen.toLowerCase().trim() == genero!.toLowerCase().trim()) {
          print('Adicinopu');
          filmesGenero.add(fil);
        }
      }
    }
    print('atualiza');
    atualizaGenero();
  }

  @action
  void atualizaGenero() {
    filmePage = filmesGenero.asObservable();
  }

  @action
  void atualiza() {
    filmePage = filmes.asObservable();
  }

  @action
  void alfabeticoCrescente() {
    filmes.sort((a, b) => a.titulo.compareTo(b.titulo));
    atualiza();
  }

  @action
  void alfabeticoDecrescente() {
    filmes.sort((a, b) => b.titulo.compareTo(a.titulo));
    atualiza();
  }

  @action
  void visualizacaoCrescente() {
    filmes.sort((a, b) => a.popularidade.compareTo(b.popularidade));
    atualiza();
  }

  @action
  void visualizacaoDecrescente() {
    filmes.sort((a, b) => b.popularidade.compareTo(a.popularidade));
    atualiza();
  }
}
