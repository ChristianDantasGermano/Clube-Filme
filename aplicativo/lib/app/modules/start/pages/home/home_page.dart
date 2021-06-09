import 'package:aplicativo/app/modules/start/pages/home/home_store.dart';
import 'package:aplicativo/app/shared/components/content_scroll_widget.dart';
import 'package:aplicativo/app/shared/models/movie_model.dart';
import 'package:aplicativo/app/shared/pages/movie/movie_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (controller.pageController.position.haveDimensions) {
          value = controller.pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MoviePage(movie: movies[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: movies[index].imageUrl,
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          SizedBox(height: 20.0),
          ContentScrollWidget(
            images: myList,
            title: 'Top Críticas',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 10.0),
          ContentScrollWidget(
            images: popular,
            title: 'Top Usuários',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}
