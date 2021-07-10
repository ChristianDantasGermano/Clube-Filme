import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';

abstract class IDiretoresRepository {
  Stream<List<Pessoa>> getTodos();
}
