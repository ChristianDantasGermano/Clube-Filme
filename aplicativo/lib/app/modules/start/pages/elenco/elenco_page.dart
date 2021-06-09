import 'package:aplicativo/app/modules/start/pages/elenco/components/elenco_modal_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ElencoPage extends StatefulWidget {
  @override
  ElencoPageState createState() => ElencoPageState();
}

class ElencoPageState extends State<ElencoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Famosos",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.reorder_outlined),
                      color: Colors.black54,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return ElencoModalWidget();
                          },
                        );
                      },
                    ),
                  ),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                                        image: new CachedNetworkImageProvider(
                                            "https://www.nomesdemeninos.com.br/wp-content/uploads/2020/01/tom-cruise-240x300.jpg")))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Amorinha Salgado Aricato",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      "Ator",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
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
