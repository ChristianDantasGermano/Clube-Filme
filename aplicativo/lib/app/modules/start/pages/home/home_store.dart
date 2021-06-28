import 'package:aplicativo/app/shared/firestore/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/models/slide_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);

  FirestoreController firestore = Modular.get();

  List<Filme> getSlider() {
    List<Slide> slides = firestore.slideList!.data;
    return slides.first.getFilmes(firestore.filmesList!.data);
  }

  List<Filme> getCriticas() {
    List<Filme> filme = firestore.filmesList!.data;
    filme.sort((a, b) => a.notaCritico.compareTo(b.notaCritico));
    return filme;
  }

  List<Filme> getUsuarios() {
    List<Filme> filmer = firestore.filmesList!.data;
    filmer.sort((a, b) => b.notaCritico.compareTo(a.notaCritico));
    return filmer;
  }
}
