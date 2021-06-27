import 'package:aplicativo/app/modules/splashDados/splashDados_store.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
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
        if (controller.atoresList!.hasError) {
          return Center(child: Text("Erro"));
        }

        if (controller.atoresList!.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Pessoa> list = controller.atoresList!.data;

        controller.repositoryFilmes.getTodos().first.then((value) {
          print(controller.atoresList?.data);
          print(value.first.getAutores((controller.atoresList?.data)));
          print(value.first.data);
          print(value.first.duracao);
          print(value.first.generos);
          print(value.first.imagem);
          print(value.first.local);
          print(value.first.notaCritico);
          print(value.first.notaUsuario);
          print(value.first.popularidade);
          print(value.first.sinopse);
          print(value.first.status);
          print(value.first.tagline);
          print(value.first.titulo);
          print(value.first.video);
        });
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              Pessoa model = list[index];
              return Text(model.nome.toString());
            });
      }),
    );
  }
}
