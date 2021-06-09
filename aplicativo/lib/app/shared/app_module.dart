import 'package:aplicativo/app/modules/login/login_module.dart';
import 'package:aplicativo/app/modules/start/start_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/start', module: StartModule()),
  ];
}
