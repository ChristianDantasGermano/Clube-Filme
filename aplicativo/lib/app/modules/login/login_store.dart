import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  AuthController auth = Modular.get();
  @action
  Future loginWithGoogle() async {
    try {
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/start');
    } catch (e) {
      print('Erro');
    }
  }
}
