import 'package:aplicativo/app/shared/firestore/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/firestore/models/slide_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splashDados_store.g.dart';

class SplashDadosStore = _SplashDadosStoreBase with _$SplashDadosStore;

abstract class _SplashDadosStoreBase with Store {
  FirestoreController firestore = Modular.get();
  @action
  void start() {
    Modular.to.pushReplacementNamed('/start');
  }

  @action
  ObservableStream<List<Pessoa>>? listAutor() {
    return firestore.atoresList;
  }

  ObservableStream<List<Pessoa>>? listDiretor() {
    return firestore.diretoresList;
  }

  ObservableStream<List<Filme>>? listFilmes() {
    return firestore.filmesList;
  }

  ObservableStream<List<Slide>>? listSlide() {
    return firestore.slideList;
  }
}
