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

  @observable
  User? usuarioGoogle;

  @action
  setUsuario(Usuario? value, User? google) async {
    print("Usuario");
    usuario = value;
    usuarioGoogle = google;
    if (usuarioGoogle != null) {
      print("Google: " + usuarioGoogle.toString());
    }

    if (usuarioGoogle == null) {
      status = AuthStatus.logoff;
    } else if ((usuario == null || usuario?.email == "") &&
        usuarioGoogle == null) {
      status = AuthStatus.logoff;
    } else if (usuario == null && usuarioGoogle != null) {
      await _authRepository.preencherUsuario();
      usuario = _authRepository.getUsuario();
      status = AuthStatus.login;
    } else {
      status = AuthStatus.login;
    }

    if (usuario != null) {
      print("Email: " + usuario!.email);
      print("Imagem: " + usuario!.imagem);
      print("Nome: " + usuario!.nome);
    }
    print("AuthControllerStatus" + status.toString());
  }

  @action
  inicializarLogin() async {
    await setUsuario(
        _authRepository.getUsuario(), _authRepository.getUsuarioGoogle());
  }

  @action
  Future loginWithGoogle() async {
    await _authRepository.getGoogleLogin();
    setUsuario(
        _authRepository.getUsuario(), _authRepository.getUsuarioGoogle());
  }

  @action
  Future logOut() {
    return _authRepository.getLogout();
  }

  @action
  reloadUsuario() {
    _authRepository.getUsuario();
  }

  @action
  setLogin() {
    status = AuthStatus.login;
  }
}

enum AuthStatus { loading, login, logoff }
