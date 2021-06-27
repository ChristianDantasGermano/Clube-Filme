//Importações Firabase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlidersRemoteRepository {
  Future<void> preencherSliders() async {
    //Iniciar comunicação com Firabase
    await Firebase.initializeApp();

    //Instânciar as coleções do firabase a serem usadas
    CollectionReference slidersRemote =
        FirebaseFirestore.instance.collection('Sliders');
    CollectionReference filmesRemote =
        FirebaseFirestore.instance.collection('Filmes');

    //Listas a serem usadas
    List listSliders = [];

    await filmesRemote
        .orderBy("Popularidade", descending: true)
        .limit(3)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listSliders.add(element.reference);
      });
    });

    slidersRemote
        .doc("EmUso")
        .set({"Filmes": FieldValue.arrayUnion(listSliders)});
  }
}
