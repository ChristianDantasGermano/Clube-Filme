import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/Dados/repositories/atores_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AtoresRepository implements IAtoresRepository {
  final FirebaseFirestore firestore;

  AtoresRepository(this.firestore);

  @override
  Stream<List<Pessoa>> getTodos() {
    return firestore.collection('Atores').snapshots().map((query) {
      return query.docs.map((doc) {
        return Pessoa.fromDocument(doc);
      }).toList();
    });
  }
}
