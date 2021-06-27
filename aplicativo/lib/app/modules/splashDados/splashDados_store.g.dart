// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splashDados_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashDadosStore on _SplashDadosStoreBase, Store {
  final _$atoresListAtom = Atom(name: '_SplashDadosStoreBase.atoresList');

  @override
  ObservableStream<List<Pessoa>>? get atoresList {
    _$atoresListAtom.reportRead();
    return super.atoresList;
  }

  @override
  set atoresList(ObservableStream<List<Pessoa>>? value) {
    _$atoresListAtom.reportWrite(value, super.atoresList, () {
      super.atoresList = value;
    });
  }

  final _$diretoresListAtom = Atom(name: '_SplashDadosStoreBase.diretoresList');

  @override
  ObservableStream<List<Pessoa>>? get diretoresList {
    _$diretoresListAtom.reportRead();
    return super.diretoresList;
  }

  @override
  set diretoresList(ObservableStream<List<Pessoa>>? value) {
    _$diretoresListAtom.reportWrite(value, super.diretoresList, () {
      super.diretoresList = value;
    });
  }

  final _$filmesListAtom = Atom(name: '_SplashDadosStoreBase.filmesList');

  @override
  ObservableStream<List<Filme>>? get filmesList {
    _$filmesListAtom.reportRead();
    return super.filmesList;
  }

  @override
  set filmesList(ObservableStream<List<Filme>>? value) {
    _$filmesListAtom.reportWrite(value, super.filmesList, () {
      super.filmesList = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_SplashDadosStoreBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$_SplashDadosStoreBaseActionController =
      ActionController(name: '_SplashDadosStoreBase');

  @override
  void start() {
    final _$actionInfo = _$_SplashDadosStoreBaseActionController.startAction(
        name: '_SplashDadosStoreBase.start');
    try {
      return super.start();
    } finally {
      _$_SplashDadosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
atoresList: ${atoresList},
diretoresList: ${diretoresList},
filmesList: ${filmesList}
    ''';
  }
}
