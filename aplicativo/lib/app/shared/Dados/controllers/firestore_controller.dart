import 'package:aplicativo/app/shared/Dados/models/filme_models.dart';
import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/Dados/models/slide_model.dart';
import 'package:aplicativo/app/shared/Dados/repositories/atores_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/diretores_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/filmes_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/slider_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'firestore_controller.g.dart';

class FirestoreController = _FirestoreControllerBase with _$FirestoreController;

abstract class _FirestoreControllerBase with Store {
  final IAtoresRepository repositoryAtores;
  final IDiretoresRepository repositoryDiretores;
  final IFilmeRepository repositoryFilmes;
  final ISlideRepository repositorySlider;

  @observable
  ObservableStream<List<Pessoa>>? atoresList;

  @observable
  ObservableStream<List<Pessoa>>? diretoresList;

  @observable
  ObservableStream<List<Filme>>? filmesList;

  @observable
  ObservableStream<List<Slide>>? slideList;

  _FirestoreControllerBase(this.repositoryAtores, this.repositoryDiretores,
      this.repositoryFilmes, this.repositorySlider) {
    atualizarDados();
  }

  atualizarDados() {
    diretoresList = repositoryDiretores.getTodos().asObservable();
    atoresList = repositoryAtores.getTodos().asObservable();
    filmesList = repositoryFilmes.getTodos().asObservable();
    slideList = repositorySlider.getTodos().asObservable();
  }
}
