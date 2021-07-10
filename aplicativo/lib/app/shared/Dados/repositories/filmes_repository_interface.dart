import 'package:aplicativo/app/shared/Dados/models/filme_models.dart';

abstract class IFilmeRepository {
  Stream<List<Filme>> getTodos();
}
