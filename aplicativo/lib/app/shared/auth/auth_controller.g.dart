// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$usuarioAtom = Atom(name: '_AuthControllerBase.usuario');

  @override
  Usuario? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$usuarioGoogleAtom = Atom(name: '_AuthControllerBase.usuarioGoogle');

  @override
  User? get usuarioGoogle {
    _$usuarioGoogleAtom.reportRead();
    return super.usuarioGoogle;
  }

  @override
  set usuarioGoogle(User? value) {
    _$usuarioGoogleAtom.reportWrite(value, super.usuarioGoogle, () {
      super.usuarioGoogle = value;
    });
  }

  final _$setUsuarioAsyncAction = AsyncAction('_AuthControllerBase.setUsuario');

  @override
  Future setUsuario(Usuario? value, User? google) {
    return _$setUsuarioAsyncAction.run(() => super.setUsuario(value, google));
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  Future<dynamic> logOut() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.logOut');
    try {
      return super.logOut();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reloadUsuario() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.reloadUsuario');
    try {
      return super.reloadUsuario();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
usuario: ${usuario},
usuarioGoogle: ${usuarioGoogle}
    ''';
  }
}
