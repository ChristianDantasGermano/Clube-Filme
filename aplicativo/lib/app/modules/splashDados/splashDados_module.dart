import 'package:aplicativo/app/modules/splashDados/splashDados_page.dart';
import 'package:aplicativo/app/modules/splashDados/splashDados_store.dart';
import 'package:aplicativo/app/shared/firestore/repositories/atores_repository.dart';
import 'package:aplicativo/app/shared/firestore/repositories/atores_repository_interface.dart';
import 'package:aplicativo/app/shared/firestore/repositories/diretores_repository.dart';
import 'package:aplicativo/app/shared/firestore/repositories/diretores_repository_interface.dart';
import 'package:aplicativo/app/shared/firestore/repositories/filme_repository.dart';
import 'package:aplicativo/app/shared/firestore/repositories/filmes_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashDadosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SplashDadosStore(i.get<IAtoresRepository>(),
        i.get<IDiretoresRepository>(), i.get<IFilmeRepository>())),
    Bind<IAtoresRepository>(
        (i) => AtoresRepository(FirebaseFirestore.instance)),
    Bind<IDiretoresRepository>(
        (i) => DiretoresRepository(FirebaseFirestore.instance)),
    Bind<IFilmeRepository>((i) => FilmeRepository(FirebaseFirestore.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashDadosPage()),
  ];
}
