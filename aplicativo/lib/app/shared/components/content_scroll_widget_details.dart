import 'package:aplicativo/app/shared/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContentScrollWidgetDetails extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final Movie movie;

  ContentScrollWidgetDetails({
    required this.images,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
    required this.movie,
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
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 25.0,
                  ),
                  width: imageWidth,
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
                          image: CachedNetworkImageProvider(
                              movie.photoActors[index]))));
            },
          ),
        ),
      ],
    );
  }
}
