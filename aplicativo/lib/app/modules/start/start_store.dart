import 'package:aplicativo/app/modules/start/components/hide_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store implements Disposable {
  final pageViewController = PageController();
  //Bottom Bar
  final HideNavbar hiding = HideNavbar();

  void dispose() {
    pageViewController.dispose();
    hiding.dispose();
  }
}
