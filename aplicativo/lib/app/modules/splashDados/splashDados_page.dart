import 'package:aplicativo/app/modules/splashDados/splashDados_store.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/firestore/models/slide_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SplashDadosPage extends StatefulWidget {
  @override
  SplashDadosPageState createState() => SplashDadosPageState();
}

class SplashDadosPageState
    extends ModularState<SplashDadosPage, SplashDadosStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (controller.listAutor()!.hasError) {
          return Center(child: Text("Erro Autor"));
        }
        if (controller.listDiretor()!.hasError) {
          return Center(child: Text("Erro Diretor"));
        }
        if (controller.listFilmes()!.hasError) {
          return Center(child: Text("Erro Filmes"));
        }
        if (controller.listSlide()!.hasError) {
          return Center(child: Text("Erro Slide"));
        }

        if (controller.listAutor()!.data != null &&
            controller.listDiretor()!.data != null &&
            controller.listFilmes()!.data != null &&
            controller.listSlide()!.data != null) {
          Modular.to.popAndPushNamed('/start');
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
