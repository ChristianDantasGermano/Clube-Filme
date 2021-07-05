import 'package:aplicativo/app/modules/splashDados/splashDados_page.dart';
import 'package:aplicativo/app/modules/splashDados/splashDados_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashDadosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SplashDadosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashDadosPage()),
  ];
}
