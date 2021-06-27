import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  _SplashStoreBase() {
    print("construtor splash store base");
  }

  @action
  void login() {
    Modular.to.pushReplacementNamed('/login');
  }
}
