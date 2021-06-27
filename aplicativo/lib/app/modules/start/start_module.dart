import 'package:aplicativo/app/modules/start/pages/favoritos/favoritos_store.dart';
import 'package:aplicativo/app/modules/start/pages/home/home_store.dart';
import 'package:aplicativo/app/modules/start/pages/perfil/perfil_page.dart';
import 'package:aplicativo/app/modules/start/start_page.dart';
import 'package:aplicativo/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => StartStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => FavoritosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/start',
      child: (context, args) => StartPage(),
    ),
    ChildRoute(
      '/perfil',
      child: (context, args) => PerfilPage(),
    )
  ];
}
