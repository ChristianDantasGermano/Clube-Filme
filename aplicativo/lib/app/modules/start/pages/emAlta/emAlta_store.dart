import 'package:aplicativo/app/shared/firestore/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'emAlta_store.g.dart';

class EmAltaStore = _EmAltaStoreBase with _$EmAltaStore;

abstract class _EmAltaStoreBase with Store {
  FirestoreController firestore = Modular.get();

  List<Filme> emAlta = [];

  _EmAltaStoreBase() {
    emAlta = firestore.filmesList!.data;
    atualizaEmAlta();
  }

  @action
  void atualizaEmAlta() {
    emAlta.sort((a, b) => b.popularidade.compareTo(a.popularidade));
  }
}
