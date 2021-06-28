import 'dart:io';
import 'dart:ui';

import 'package:aplicativo/app/modules/start/start_store.dart';
import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class PerfilPage extends StatefulWidget {
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends ModularState<PerfilPage, StartStore> {
  File? arquivo;
  final imagePicker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  CollectionReference usuariosRef =
      FirebaseFirestore.instance.collection('Usuarios');

  Future _tirarFoto() async {
    final imagem = await imagePicker.getImage(source: ImageSource.camera);
    Directory diretorio = await getApplicationDocumentsDirectory();
    if (imagem != null) {
      setState(() {
        arquivo = File(imagem.path);
      });
      try {
        var upload = await firebase_storage.FirebaseStorage.instance
            .ref('${controller.usuarioGoogle()!.uid}')
            .putFile(arquivo!);
        final String downloadUrl = await upload.ref.getDownloadURL();
        await usuariosRef
            .doc(controller.usuarioGoogle()!.uid.toString())
            .update({'Imagem': downloadUrl});
        print(controller.usuario()!.imagem.toString());
        controller.auth.reloadUsuario();
      } on firebase_core.FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
      }
    }
  }

  Future _escolherImagem() async {
    final imagem = await imagePicker.getImage(source: ImageSource.gallery);
    if (imagem != null) {
      setState(() {
        arquivo = File(imagem.path);
      });
      try {
        var upload = await firebase_storage.FirebaseStorage.instance
            .ref('${controller.usuarioGoogle()!.uid}')
            .putFile(arquivo!);
        final String downloadUrl = await upload.ref.getDownloadURL();
        await usuariosRef
            .doc(controller.usuarioGoogle()!.uid.toString())
            .update({'Imagem': downloadUrl});
        print(controller.usuario()!.imagem.toString());
        await controller.auth.reloadUsuario();
        await controller.perfil();
      } on firebase_core.FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("PERFIL")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0, // changes position of shadow
                          ),
                        ],
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                controller.usuario()!.imagem.toString())))),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.usuario()!.nome.toString(),
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.usuario()!.email.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: _tirarFoto,
                    icon: Icon(Icons.camera_alt),
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Tirar foto'),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        textStyle: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('ou'),
                ),
                Container(
                  child: OutlinedButton.icon(
                    onPressed: _escolherImagem,
                    icon: Icon(Icons.image_outlined),
                    label: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Escolher imagem da galeria'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
