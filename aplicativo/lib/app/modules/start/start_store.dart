import 'package:aplicativo/app/modules/start/components/hide_navbar.dart';
import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:aplicativo/app/shared/auth/models/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  final pageViewController = PageController();
  //Bottom Bar
  final HideNavbar hiding = HideNavbar();

  void dispose() {
    pageViewController.dispose();
    hiding.dispose();
  }

  @action
  logoff() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }

  @action
  Usuario? usuario() {
    return Modular.get<AuthController>().usuario;
  }

  @action
  perfil() {
    Modular.to.navigate('/start/perfil');
  }
}
