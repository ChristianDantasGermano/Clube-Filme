import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String email;
  String imagem;
  String nome;

  Usuario({
    required this.email,
    required this.imagem,
    required this.nome,
  });

  factory Usuario.fromDocument(DocumentSnapshot doc) {
    return Usuario(
      email: doc['Email'],
      imagem: doc['Imagem'],
      nome: doc['Nome'],
    );
  }

  clean() {
    return Usuario(
      email: "",
      imagem: "",
      nome: "",
    );
  }
}
