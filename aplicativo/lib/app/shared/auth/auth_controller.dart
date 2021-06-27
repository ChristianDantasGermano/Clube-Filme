import 'package:aplicativo/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'models/Usuario.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  Usuario? usuario;

  @action
  setUsuario(Usuario? value) {
    print("emtrou setusuario");
    usuario = value;
    if (usuario?.email == "" || usuario == null) {
      status = AuthStatus.logoff;
    } else {
      status = AuthStatus.login;
    }
  }

  _AuthControllerBase() {
    setUsuario(_authRepository.getUsuario());
  }

  @action
  Future loginWithGoogle() async {
    status = AuthStatus.login;
    await _authRepository.getGoogleLogin();
    setUsuario(_authRepository.getUsuario());
  }

  @action
  Future logOut() {
    status = AuthStatus.logoff;
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff }
