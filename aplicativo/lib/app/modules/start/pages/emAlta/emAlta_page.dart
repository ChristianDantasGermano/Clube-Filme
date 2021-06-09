import 'package:aplicativo/app/shared/models/emAlta_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EmAltaPage extends StatefulWidget {
  @override
  EmAltaPageState createState() => EmAltaPageState();
}

class EmAltaPageState extends State<EmAltaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Em Alta",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    scrollDirection: Axis.vertical,
                    itemCount: myList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Alta lista = textos[index];
                      return Container(
                        child: Card(
                          margin: const EdgeInsets.all(10.0),
                          child: Row(children: [
                            Column(
                              children: [
                                Container(
                                  width: 138,
                                  height: 210,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 6.0,
                                  ),
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: myList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 170,
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.justify,
                                        strutStyle: StrutStyle(fontSize: 12.0),
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            text: lista.title),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    lista.categories,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  //Erro no PArentDataWiget nesse container
                                  Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        lista.description.replaceAll("\n", " "),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ]),
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
