import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';

abstract class IFilmeRepository {
  Stream<List<Filme>> getTodos();
}
