//Importações Firabase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmAltaRemoteRepository {
  Future<void> preencherEmAlta() async {
    //Iniciar comunicação com Firabase
    await Firebase.initializeApp();

    //Instânciar as coleções do firabase a serem usadas
    CollectionReference emAltaRemote =
        FirebaseFirestore.instance.collection('Em Alta');
    CollectionReference filmesRemote =
        FirebaseFirestore.instance.collection('Filmes');

    //Listas a serem usadas
    List listEmAlta = [];
    List listFilmes = [];
    await filmesRemote
        .orderBy("Popularidade", descending: true)
        .limit(10)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listEmAlta.add({"Filme": element.reference});
      });
    });

    emAltaRemote
        .doc("EmUso")
        .set({"Filmes": FieldValue.arrayUnion(listEmAlta)});
  }
}
