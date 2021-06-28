import 'package:aplicativo/app/shared/firestore/models/slide_model.dart';

abstract class ISlideRepository {
  Stream<List<Slide>> getTodos();
}
