import 'package:mobx/mobx.dart';

part 'filmes_store.g.dart';

class FilmesStore = _FilmesStoreBase with _$FilmesStore;

abstract class _FilmesStoreBase with Store {
  int value = 0;
}
