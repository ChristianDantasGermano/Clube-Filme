import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';

abstract class IDiretoresRepository {
  Stream<List<Pessoa>> getTodos();
}
