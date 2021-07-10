import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/repositories/filmes_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FilmeRepository implements IFilmeRepository {
  final FirebaseFirestore firestore;

  FilmeRepository(this.firestore);

  @override
  Stream<List<Filme>> getTodos() {
    print("GetTodos Filmes");
    return firestore.collection("Filmes").snapshots().map((query) {
      print("Query");
      return query.docs.map((doc) {
        print("Documento" + doc.toString());
        return Filme.fromDocument(doc);
      }).toList();
    });
  }
}
