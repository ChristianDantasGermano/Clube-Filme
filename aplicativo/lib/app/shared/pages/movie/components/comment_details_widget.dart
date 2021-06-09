import 'package:aplicativo/app/shared/models/reviews_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class CommentDetailsWidget extends StatelessWidget {
  final Reviews reviews;

  CommentDetailsWidget({required this.reviews});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                          text: reviews.name),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 100.0,
                        height: 100.0,
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
                                image: new NetworkImage(reviews.photo)))),
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: SingleChildScrollView(
                        child: Text(
                          reviews.comments,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: RatingBarIndicator(
                rating: (double.parse(reviews.score) / 2),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.blue[300],
                ),
                itemCount: 5,
                itemSize: 35,
                direction: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
