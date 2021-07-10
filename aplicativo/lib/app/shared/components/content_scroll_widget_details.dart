import 'package:aplicativo/app/shared/Dados/models/estudio_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContentScrollWidgetDetails extends StatelessWidget {
  final List<Estudio> estudio;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScrollWidgetDetails({
    required this.estudio,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            scrollDirection: Axis.horizontal,
            itemCount: estudio.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 25.0,
                  ),
                  width: imageWidth,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.contain,
                          image: CachedNetworkImageProvider(
                              "https://image.tmdb.org/t/p/original" +
                                  estudio[index].imagem))));
            },
          ),
        ),
      ],
    );
  }
}
