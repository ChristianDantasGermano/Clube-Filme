import 'package:aplicativo/app/modules/start/start_store.dart';
import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerWidget extends StatelessWidget {
  final StartStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.usuario()!.imagem.toString()),
                          fit: BoxFit.fill)),
                ),
                Text(
                  controller.usuario()!.nome.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Text(
                  controller.usuario()!.email.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            'Perfil',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: controller.perfil,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Configurações',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: controller.logoff,
        ),
      ],
    ));
  }
}
