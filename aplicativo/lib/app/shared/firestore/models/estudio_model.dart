import 'package:cloud_firestore/cloud_firestore.dart';

class Estudio {
  String imagem;
  String nome;
  Estudio({required this.imagem, required this.nome});

  factory Estudio.fromDocument(Map<String, dynamic> doc) {
    return Estudio(imagem: doc['Imagen'], nome: doc['Nome']);
  }
}
