import 'package:aplicativo/app/shared/Dados/models/slide_model.dart';

abstract class ISlideRepository {
  Stream<List<Slide>> getTodos();
}
