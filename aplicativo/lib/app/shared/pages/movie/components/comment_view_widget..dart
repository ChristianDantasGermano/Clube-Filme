import 'package:aplicativo/app/shared/models/reviews_model.dart';
import 'package:aplicativo/app/shared/pages/movie/components/comment_create_widget..dart';
import 'package:aplicativo/app/shared/pages/movie/components/comment_details_widget.dart';
import 'package:flutter/material.dart';

class CommentViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Avaliações",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150.0,
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        Reviews comment = reviews[index];
                        return RawMaterialButton(
                            padding: EdgeInsets.all(10.0),
                            elevation: 12.0,
                            onPressed: () => {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CommentDetailsWidget(
                                          reviews: comment);
                                    },
                                  ),
                                },
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0.0, 4.0),
                                              blurRadius:
                                                  6.0, // changes position of shadow
                                            ),
                                          ],
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  comment.photo)))),
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.justify,
                                      strutStyle: StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                          style:
                                              TextStyle(color: Colors.black54),
                                          text: comment.comments),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(10.0),
                      elevation: 12.0,
                      onPressed: () => {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return CommentCreateWidget();
                          },
                        ),
                      },
                      shape: CircleBorder(),
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        size: 33.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
