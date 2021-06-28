import 'package:aplicativo/app/modules/start/pages/filmes/components/movie_modal_widget.dart';
import 'package:aplicativo/app/modules/start/pages/filmes/filmes_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilmesPage extends StatefulWidget {
  @override
  FilmesPageState createState() => FilmesPageState();
}

class FilmesPageState extends ModularState<FilmesPage, FilmesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Filmes",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.reorder_outlined),
                      color: Colors.black54,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return MovieModalWidget();
                          },
                        );
                      },
                    ),
                  ),
                  Observer(builder: (_) {
                    if (controller.filmePage!.length <= 0) {
                      return Center(
                        child: Column(
                          children: [
                            Text("Filme não encontrado"),
                            ElevatedButton(
                              onPressed: controller.reset,
                              child: Text("Reset"),
                            )
                          ],
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: controller.filmePage?.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (1.35 / 2),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 4.0),
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              imageUrl: "https://image.tmdb.org/t/p/original" +
                                  controller
                                      .filmePage![index].imagem.linkCartaz,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
