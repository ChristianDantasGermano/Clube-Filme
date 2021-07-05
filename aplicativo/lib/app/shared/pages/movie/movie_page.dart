import 'package:aplicativo/app/shared/components/circular_clipper_widget.dart';
import 'package:aplicativo/app/shared/components/content_scroll_widget_details.dart';
import 'package:aplicativo/app/shared/firestore/models/filme_models.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/pages/movie/components/actor_view_widget.dart';
import 'package:aplicativo/app/shared/pages/movie/components/comment_view_widget..dart';
import 'package:aplicativo/app/shared/pages/movie/components/score_view_widget..dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviePage extends StatefulWidget {
  final Filme filme;
  final List<Pessoa> diretor;
  final List<Pessoa> autor;

  MoviePage({required this.filme, required this.diretor, required this.autor});

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool checkFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.filme.imagem.linkBackground,
                  child: ClipShadowPathWidget(
                    clipper: CircularClipperWidget(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "https://image.tmdb.org/t/p/original" +
                              widget.filme.imagem.linkBackground),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => setState(() {
                      if (checkFavorite) {
                        checkFavorite = false;
                      } else {
                        checkFavorite = true;
                      }
                    }),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      checkFavorite
                          ? Icons.favorite_outline
                          : Icons.favorite_outlined,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => launch(widget.filme.video.first.link),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.movie,
                      size: 60.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.filme.titulo.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.filme.tagline,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.filme.generos.first,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ScoreViewWidget(
                        //Área das notas
                        nota: widget.filme.notaCritico.toString(),
                        title: "Críticos",
                        cor: Colors.black,
                      ),
                      SizedBox(width: 30),
                      ScoreViewWidget(
                        nota: "7.9",
                        title: "Usuários",
                        cor: Colors.green,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Data',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.filme.data,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'País',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.filme.local.sigla.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Duração',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.filme.duracao} min',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.filme.sinopse,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  child: Column(
                    children: <Widget>[
                      new Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Direção",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      new Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 6.0, // changes position of shadow
                                ),
                              ],
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new NetworkImage(
                                      "https://image.tmdb.org/t/p/original" +
                                          widget.filme
                                              .getDiretor(widget.diretor)
                                              .imagem)))),
                      new Text(
                        widget.filme.getDiretor(widget.diretor).nome,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                ActorViewWidget(
                    pessoa: widget.filme
                        .getAutores(widget.autor)), //Área dos autores
                SizedBox(height: 25.0),
              ],
            ),
          ),
          ContentScrollWidgetDetails(
            //Área de imagens do filme
            estudio: widget.filme.estudio,
            title: 'Produtoras',
            imageHeight: 150.0,
            imageWidth: 150.0,
          ),
          CommentViewWidget(), //Área dos comentários
        ],
      ),
    );
  }
}
