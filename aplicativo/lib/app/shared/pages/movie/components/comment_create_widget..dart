import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentCreateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: 250,
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
                          text: 'Gatos anônimos',
                        ),
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
                                  image: new NetworkImage(
                                      'https://www.petz.com.br/blog/wp-content/uploads/2020/02/cat-sitting.jpg')))),
                    ],
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: SingleChildScrollView(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Escreva uma avaliação'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 5),
              Center(
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.blue[300],
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RawMaterialButton(
                    elevation: 1,
                    onPressed: () => print("Sou lindo"),
                    fillColor: Colors.white,
                    child: Text("Postar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
