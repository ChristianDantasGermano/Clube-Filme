// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elenco_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ElencoStore on _ElencoStoreBase, Store {
  final _$pessoaPageAtom = Atom(name: '_ElencoStoreBase.pessoaPage');

  @override
  ObservableList<Pessoa>? get pessoaPage {
    _$pessoaPageAtom.reportRead();
    return super.pessoaPage;
  }

  @override
  set pessoaPage(ObservableList<Pessoa>? value) {
    _$pessoaPageAtom.reportWrite(value, super.pessoaPage, () {
      super.pessoaPage = value;
    });
  }

  final _$cargoAtom = Atom(name: '_ElencoStoreBase.cargo');

  @override
  String get cargo {
    _$cargoAtom.reportRead();
    return super.cargo;
  }

  @override
  set cargo(String value) {
    _$cargoAtom.reportWrite(value, super.cargo, () {
      super.cargo = value;
    });
  }

  final _$_ElencoStoreBaseActionController =
      ActionController(name: '_ElencoStoreBase');

  @override
  dynamic getCargo() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.getCargo');
    try {
      return super.getCargo();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCargo(String value) {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.setCargo');
    try {
      return super.setCargo(value);
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoCrescenteAtor() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.alfabeticoCrescenteAtor');
    try {
      return super.alfabeticoCrescenteAtor();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoDecrescenteAtor() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.alfabeticoDecrescenteAtor');
    try {
      return super.alfabeticoDecrescenteAtor();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popularidadeCrescenteAtor() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.popularidadeCrescenteAtor');
    try {
      return super.popularidadeCrescenteAtor();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popularidadeDecrescenteAtor() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.popularidadeDecrescenteAtor');
    try {
      return super.popularidadeDecrescenteAtor();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoCrescenteDiretor() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.alfabeticoCrescenteDiretor');
    try {
      return super.alfabeticoCrescenteDiretor();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alfabeticoDecrescenteDireto() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.alfabeticoDecrescenteDireto');
    try {
      return super.alfabeticoDecrescenteDireto();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popularidadeCrescenteDireto() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.popularidadeCrescenteDireto');
    try {
      return super.popularidadeCrescenteDireto();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popularidadeDecrescenteDireto() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.popularidadeDecrescenteDireto');
    try {
      return super.popularidadeDecrescenteDireto();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualiza() {
    final _$actionInfo = _$_ElencoStoreBaseActionController.startAction(
        name: '_ElencoStoreBase.atualiza');
    try {
      return super.atualiza();
    } finally {
      _$_ElencoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pessoaPage: ${pessoaPage},
cargo: ${cargo}
    ''';
  }
}
