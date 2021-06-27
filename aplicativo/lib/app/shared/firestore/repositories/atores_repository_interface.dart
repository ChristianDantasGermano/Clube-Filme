import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';

abstract class IAtoresRepository {
  Stream<List<Pessoa>> getTodos();
}
