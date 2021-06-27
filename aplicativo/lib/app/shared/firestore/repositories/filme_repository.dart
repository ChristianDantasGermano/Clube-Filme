import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/repositories/filmes_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FilmeRepository implements IFilmeRepository {
  final FirebaseFirestore firestore;

  FilmeRepository(this.firestore);

  @override
  Stream<List<Filme>> getTodos() {
    return firestore.collection('Filmes').snapshots().map((query) {
      return query.docs.map((doc) {
        return Filme.fromDocument(doc);
      }).toList();
    });
  }
}
