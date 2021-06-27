import 'package:cloud_firestore/cloud_firestore.dart';

class Slide {
  final List<DocumentReference> reference;

  Slide({required this.reference});

  factory Slide.fromDocument(DocumentSnapshot doc) {
    List<DocumentReference> list = [];
    for (var ref in doc['Filmes']) {
      list.add(ref);
    }

    return Slide(reference: list);
  }
}
