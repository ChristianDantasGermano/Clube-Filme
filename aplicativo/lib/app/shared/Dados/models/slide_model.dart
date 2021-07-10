import 'package:aplicativo/app/shared/Dados/models/filme_models.dart';
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

  List<Filme> getFilmes(List<Filme> filmes) {
    List<Filme> filme = [];

    for (Filme f in filmes) {
      for (DocumentReference r in reference) {
        if (f.reference == r) {
          filme.add(f);
        }
      }
    }

    return filme;
  }
}
