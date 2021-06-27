//Importações Firabase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopCriticosRemoteRepository {
  Future<void> preencherTopCriticos() async {
    //Iniciar comunicação com Firabase
    await Firebase.initializeApp();

    //Instânciar as coleções do firabase a serem usadas
    CollectionReference topCriticosRemote =
        FirebaseFirestore.instance.collection('Top Criticos');
    CollectionReference filmesRemote =
        FirebaseFirestore.instance.collection('Filmes');

    //Listas a serem usadas
    List listTopCriticos = [];

    await filmesRemote
        .orderBy("NotaCriticos", descending: true)
        .limit(10)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listTopCriticos.add({"Filme": element.reference});
      });
    });

    topCriticosRemote
        .doc("EmUso")
        .set({"Filmes": FieldValue.arrayUnion(listTopCriticos)});
  }
}
