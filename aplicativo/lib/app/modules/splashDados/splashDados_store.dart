import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/firestore/repositories/atores_repository_interface.dart';
import 'package:aplicativo/app/shared/firestore/repositories/diretores_repository_interface.dart';
import 'package:aplicativo/app/shared/firestore/repositories/filmes_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splashDados_store.g.dart';

class SplashDadosStore = _SplashDadosStoreBase with _$SplashDadosStore;

abstract class _SplashDadosStoreBase with Store {
  final IAtoresRepository repositoryAtores;
  final IDiretoresRepository repositoryDiretores;
  final IFilmeRepository repositoryFilmes;

  @observable
  ObservableStream<List<Pessoa>>? atoresList;

  @observable
  ObservableStream<List<Pessoa>>? diretoresList;

  @observable
  ObservableStream<List<Filme>>? filmesList;

  _SplashDadosStoreBase(
      this.repositoryAtores, this.repositoryDiretores, this.repositoryFilmes) {
    get();
  }

  @action
  get() async {
    diretoresList = repositoryDiretores.getTodos().asObservable();
    atoresList = repositoryAtores.getTodos().asObservable();
    filmesList = repositoryFilmes.getTodos().asObservable();
  }

  @action
  void start() {
    Modular.to.pushReplacementNamed('/start');
  }
}
