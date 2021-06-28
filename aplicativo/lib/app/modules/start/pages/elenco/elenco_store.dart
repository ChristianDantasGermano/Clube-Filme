import 'package:aplicativo/app/shared/firestore/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'elenco_store.g.dart';

class ElencoStore = _ElencoStoreBase with _$ElencoStore;

abstract class _ElencoStoreBase with Store {
  FirestoreController firestore = Modular.get();

  @observable
  ObservableList<Pessoa>? pessoaPage;

  @observable
  String cargo = "Diretores";

  List<Pessoa> atores = [];
  List<Pessoa> diretores = [];

  _ElencoStoreBase() {
    diretores = firestore.diretoresList!.data;
    atores = firestore.atoresList!.data;
    atualiza();
  }

  @action
  getCargo() {
    return cargo;
  }

  @action
  setCargo(String value) {
    cargo = value;
    print(cargo);
    atualiza();
  }

  //Ator
  @action
  void alfabeticoCrescenteAtor() {
    atores.sort((a, b) => a.nome.compareTo(b.nome));
    atualiza();
  }

  @action
  void alfabeticoDecrescenteAtor() {
    atores.sort((a, b) => b.nome.compareTo(a.nome));
    atualiza();
  }

  @action
  void popularidadeCrescenteAtor() {
    atores.sort((a, b) => a.popularidade.compareTo(b.popularidade));
    atualiza();
  }

  @action
  void popularidadeDecrescenteAtor() {
    atores.sort((a, b) => b.popularidade.compareTo(a.popularidade));
    atualiza();
  }

  //Diretor
  @action
  void alfabeticoCrescenteDiretor() {
    diretores.sort((a, b) => a.nome.compareTo(b.nome));
    atualiza();
  }

  @action
  void alfabeticoDecrescenteDireto() {
    diretores.sort((a, b) => b.nome.compareTo(a.nome));
    atualiza();
  }

  @action
  void popularidadeCrescenteDireto() {
    diretores.sort((a, b) => a.popularidade.compareTo(b.popularidade));
    atualiza();
  }

  @action
  void popularidadeDecrescenteDireto() {
    diretores.sort((a, b) => b.popularidade.compareTo(a.popularidade));
    atualiza();
  }

  @action
  void atualiza() {
    if (cargo == "Diretores") {
      pessoaPage = diretores.asObservable();
    } else {
      pessoaPage = atores.asObservable();
    }
  }
}
