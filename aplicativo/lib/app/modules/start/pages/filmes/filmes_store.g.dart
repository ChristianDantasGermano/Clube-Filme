// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilmesStore on _FilmesStoreBase, Store {
  final _$filmePageAtom = Atom(name: '_FilmesStoreBase.filmePage');

  @override
  ObservableList<Filme>? get filmePage {
    _$filmePageAtom.reportRead();
    return super.filmePage;
  }

  @override
  set filmePage(ObservableList<Filme>? value) {
    _$filmePageAtom.reportWrite(value, super.filmePage, () {
      super.filmePage = value;
    });
  }

  final _$generoAtom = Atom(name: '_FilmesStoreBase.genero');

  @override
  String? get genero {
    _$generoAtom.reportRead();
    return super.genero;
  }

  @override
  set genero(String? value) {
    _$generoAtom.reportWrite(value, super.genero, () {
      super.genero = value;
    });
  }

  final _$_FilmesStoreBaseActionController =
      ActionController(name: '_FilmesStoreBase');

  @override
  dynamic reset() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getGenero() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.getGenero');
    try {
      return super.getGenero();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGenero(String? value) {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.setGenero');
    try {
      return super.setGenero(value);
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizaGenero() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.atualizaGenero');
    try {
      return super.atualizaGenero();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualiza() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.atualiza');
    try {
      return super.atualiza();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoCrescente() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.alfabeticoCrescente');
    try {
      return super.alfabeticoCrescente();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoDecrescente() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.alfabeticoDecrescente');
    try {
      return super.alfabeticoDecrescente();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void visualizacaoCrescente() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.visualizacaoCrescente');
    try {
      return super.visualizacaoCrescente();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void visualizacaoDecrescente() {
    final _$actionInfo = _$_FilmesStoreBaseActionController.startAction(
        name: '_FilmesStoreBase.visualizacaoDecrescente');
    try {
      return super.visualizacaoDecrescente();
    } finally {
      _$_FilmesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filmePage: ${filmePage},
genero: ${genero}
    ''';
  }
}
