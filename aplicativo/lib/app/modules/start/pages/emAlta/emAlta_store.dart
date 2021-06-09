import 'package:mobx/mobx.dart';

part 'emAlta_store.g.dart';

class EmAltaStore = _EmAltaStoreBase with _$EmAltaStore;

abstract class _EmAltaStoreBase with Store {
  int value = 0;
}
