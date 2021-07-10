import 'package:aplicativo/app/shared/Dados/models/slide_model.dart';
import 'package:aplicativo/app/shared/Dados/repositories/slider_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlideRepository implements ISlideRepository {
  final FirebaseFirestore firestore;

  SlideRepository(this.firestore);

  @override
  Stream<List<Slide>> getTodos() {
    return firestore.collection('Sliders').snapshots().map((query) {
      return query.docs.map((doc) {
        return Slide.fromDocument(doc);
      }).toList();
    });
  }
}
