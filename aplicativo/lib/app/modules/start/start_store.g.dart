// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartStore on _StartStoreBase, Store {
  final _$authAtom = Atom(name: '_StartStoreBase.auth');

  @override
  AuthController get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(AuthController value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  final _$logoffAsyncAction = AsyncAction('_StartStoreBase.logoff');

  @override
  Future logoff() {
    return _$logoffAsyncAction.run(() => super.logoff());
  }

  final _$_StartStoreBaseActionController =
      ActionController(name: '_StartStoreBase');

  @override
  Usuario? usuario() {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.usuario');
    try {
      return super.usuario();
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic perfil() {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.perfil');
    try {
      return super.perfil();
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  User? usuarioGoogle() {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.usuarioGoogle');
    try {
      return super.usuarioGoogle();
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
auth: ${auth}
    ''';
  }
}
