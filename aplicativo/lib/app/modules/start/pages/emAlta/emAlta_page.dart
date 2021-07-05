import 'package:aplicativo/app/modules/start/pages/emAlta/emAlta_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmAltaPage extends StatefulWidget {
  @override
  EmAltaPageState createState() => EmAltaPageState();
}

class EmAltaPageState extends ModularState<EmAltaPage, EmAltaStore> {
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
                    itemCount: controller.emAlta.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/original" +
                                              controller.emAlta[index].imagem
                                                  .linkCartaz,
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
                                            text: controller
                                                .emAlta[index].titulo),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller.emAlta[index].generos.first,
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
                                        controller.emAlta[index].sinopse
                                            .replaceAll("\n", " "),
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
