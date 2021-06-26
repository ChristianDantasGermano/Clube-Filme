import 'package:aplicativo/app/modules/login/login_module.dart';
import 'package:aplicativo/app/modules/splash/splash_module.dart';
import 'package:aplicativo/app/modules/start/start_module.dart';
import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:aplicativo/app/shared/auth/repositories/auth_repository.dart';
import 'package:aplicativo/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind.lazySingleton((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/start', module: StartModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
