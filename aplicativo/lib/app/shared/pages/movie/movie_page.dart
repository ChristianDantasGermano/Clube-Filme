import 'package:aplicativo/app/shared/components/circular_clipper_widget.dart';
import 'package:aplicativo/app/shared/components/content_scroll_widget.dart';
import 'package:aplicativo/app/shared/models/movie_model.dart';
import 'package:aplicativo/app/shared/pages/movie/components/actor_view_widget.dart';
import 'package:aplicativo/app/shared/pages/movie/components/comment_view_widget..dart';
import 'package:aplicativo/app/shared/pages/movie/components/score_view_widget..dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage({required this.movie});

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
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPathWidget(
                    clipper: CircularClipperWidget(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(widget.movie.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.movie.categories,
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
                        nota: "4.9",
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
                          'Ano',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.year.toString(),
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
                          widget.movie.country.toUpperCase(),
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
                          '${widget.movie.length} min',
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
                      widget.movie.description,
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
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://static.wikia.nocookie.net/ptstarwars/images/5/5e/Lucas.JPG/revision/latest?cb=20060504214710")))),
                      new Text(
                        'George Lucas',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                ActorViewWidget(movie: widget.movie), //Área dos autores
                SizedBox(height: 25.0),
              ],
            ),
          ),
          ContentScrollWidget(
            //Área de imagens do filme
            images: widget.movie.screenshots,
            title: 'Imagens',
            imageHeight: 200.0,
            imageWidth: 250.0,
          ),
          CommentViewWidget(), //Área dos comentários
        ],
      ),
    );
  }
}
