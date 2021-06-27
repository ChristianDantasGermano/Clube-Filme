import 'package:cloud_firestore/cloud_firestore.dart';

class Pessoa {
  String imagem;
  String nome;
  double popularidade;
  final DocumentReference reference;

  Pessoa(
      {required this.imagem,
      required this.nome,
      required this.popularidade,
      required this.reference});

  factory Pessoa.fromDocument(DocumentSnapshot doc) {
    return Pessoa(
        imagem: doc['Imagem'],
        nome: doc['Nome'],
        popularidade: doc['Popularidade'],
        reference: doc.reference);
  }
}
