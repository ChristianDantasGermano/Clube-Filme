import 'package:aplicativo/app/modules/login/login_module.dart';
import 'package:aplicativo/app/modules/splashDados/splashDados_module.dart';
import 'package:aplicativo/app/modules/start/start_module.dart';
import 'package:aplicativo/app/shared/Dados/controllers/firestore_controller.dart';
import 'package:aplicativo/app/shared/Dados/repositories/atores_repository.dart';
import 'package:aplicativo/app/shared/Dados/repositories/atores_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/diretores_repository.dart';
import 'package:aplicativo/app/shared/Dados/repositories/diretores_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/filme_repository.dart';
import 'package:aplicativo/app/shared/Dados/repositories/filmes_repository_interface.dart';
import 'package:aplicativo/app/shared/Dados/repositories/slider_repository.dart';
import 'package:aplicativo/app/shared/Dados/repositories/slider_repository_interface.dart';
import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:aplicativo/app/shared/auth/repositories/auth_repository.dart';
import 'package:aplicativo/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind.lazySingleton((i) => AuthController()),
    Bind((i) => FirestoreController(
        i.get<IAtoresRepository>(),
        i.get<IDiretoresRepository>(),
        i.get<IFilmeRepository>(),
        i.get<ISlideRepository>())),
    Bind<IAtoresRepository>(
        (i) => AtoresRepository(FirebaseFirestore.instance)),
    Bind<IDiretoresRepository>(
        (i) => DiretoresRepository(FirebaseFirestore.instance)),
    Bind<IFilmeRepository>((i) => FilmeRepository(FirebaseFirestore.instance)),
    Bind<ISlideRepository>((i) => SlideRepository(FirebaseFirestore.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/splashdados', module: SplashDadosModule()),
    ModuleRoute('/start', module: StartModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];

}
