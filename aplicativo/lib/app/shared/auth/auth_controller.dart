import 'package:aplicativo/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    setUser(_authRepository.getUser());
  }

  @action
  Future loginWithGoogle() async {
    await _authRepository.getGoogleLogin();
    setUser(_authRepository.getUser());
  }

  @action
  Future logOut() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff }
