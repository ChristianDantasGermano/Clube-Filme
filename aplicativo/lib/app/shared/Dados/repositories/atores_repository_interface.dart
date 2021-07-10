import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';

abstract class IAtoresRepository {
  Stream<List<Pessoa>> getTodos();
}
