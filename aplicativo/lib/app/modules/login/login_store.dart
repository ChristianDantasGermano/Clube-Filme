import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @action
  inicializateFirabase() async {
    return await Firebase.initializeApp();
  }

  @action
  Future loginWithGoogle() async {
    AuthController auth = Modular.get();

    print("Google 1");
    try {
      print("Google 2");
      await auth.loginWithGoogle();
      Modular.to.popAndPushNamed("/login");
    } catch (e) {
      print('Erro');
    }
  }
}
