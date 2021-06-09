import 'package:mobx/mobx.dart';

part 'elenco_store.g.dart';

class ElencoStore = _ElencoStoreBase with _$ElencoStore;

abstract class _ElencoStoreBase with Store {
  int value = 0;
}
