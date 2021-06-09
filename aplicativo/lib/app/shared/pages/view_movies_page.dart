import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewMoviesPage extends StatefulWidget {
  @override
  _ViewMoviesPageState createState() => _ViewMoviesPageState();
}

class _ViewMoviesPageState extends State<ViewMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Top Críticas",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GridView.builder(
                    itemCount: 18,
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
                            imageUrl:
                                "https://static.wikia.nocookie.net/thebate/images/e/e4/Volume4.jpg/revision/latest?cb=20200101085857",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
