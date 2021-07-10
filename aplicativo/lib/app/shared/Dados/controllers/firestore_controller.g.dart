// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirestoreController on _FirestoreControllerBase, Store {
  final _$atoresListAtom = Atom(name: '_FirestoreControllerBase.atoresList');

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

  final _$diretoresListAtom =
      Atom(name: '_FirestoreControllerBase.diretoresList');

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

  final _$filmesListAtom = Atom(name: '_FirestoreControllerBase.filmesList');

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

  final _$slideListAtom = Atom(name: '_FirestoreControllerBase.slideList');

  @override
  ObservableStream<List<Slide>>? get slideList {
    _$slideListAtom.reportRead();
    return super.slideList;
  }

  @override
  set slideList(ObservableStream<List<Slide>>? value) {
    _$slideListAtom.reportWrite(value, super.slideList, () {
      super.slideList = value;
    });
  }

  @override
  String toString() {
    return '''
atoresList: ${atoresList},
diretoresList: ${diretoresList},
filmesList: ${filmesList},
slideList: ${slideList}
    ''';
  }
}
