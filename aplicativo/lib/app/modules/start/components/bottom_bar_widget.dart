import 'package:aplicativo/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomBarWidget extends StatelessWidget {
  final StartStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.hiding.visible,
      builder: (context, bool value, child) => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: value ? kBottomNavigationBarHeight : 0.0,
        child: Wrap(
          children: <Widget>[
            AnimatedBuilder(
                animation: controller.pageViewController,
                builder: (context, snapshot) {
                  return BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex:
                        controller.pageViewController.page?.round() ?? 0,
                    onTap: (index) {
                      controller.pageViewController.jumpToPage(index);
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Início',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border_sharp),
                        label: 'Favoritos',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.movie_outlined),
                        label: 'Filmes',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.people_outline_outlined),
                        label: 'Famosos',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.local_fire_department_sharp),
                        label: 'Em Alta',
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
