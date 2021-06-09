import 'package:aplicativo/app/modules/start/components/app_bar_widget.dart';
import 'package:aplicativo/app/modules/start/components/bottom_bar_widget.dart';
import 'package:aplicativo/app/modules/start/components/drawer_widget.dart';
import 'package:aplicativo/app/modules/start/pages/elenco/elenco_page.dart';
import 'package:aplicativo/app/modules/start/pages/emAlta/emAlta_page.dart';
import 'package:aplicativo/app/modules/start/pages/favoritos/favoritos_page.dart';
import 'package:aplicativo/app/modules/start/pages/filmes/filmes_page.dart';
import 'package:aplicativo/app/modules/start/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aplicativo/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: NestedScrollView(
        controller: controller.hiding.controller,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[AppBarWidget()];
        },
        body: PageView(
          controller: controller.pageViewController,
          children: [
            HomePage(),
            FavoritosPage(),
            FilmesPage(),
            ElencoPage(),
            EmAltaPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
