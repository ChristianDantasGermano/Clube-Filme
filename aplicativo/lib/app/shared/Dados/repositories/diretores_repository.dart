import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/Dados/repositories/diretores_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiretoresRepository implements IDiretoresRepository {
  final FirebaseFirestore firestore;

  DiretoresRepository(this.firestore);

  @override
  Stream<List<Pessoa>> getTodos() {
    return firestore.collection('Diretores').snapshots().map((query) {
      print("Query diretor");
      return query.docs.map((doc) {
        return Pessoa.fromDocument(doc);
      }).toList();
    });
  }
}
