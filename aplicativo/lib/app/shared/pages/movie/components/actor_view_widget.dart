import 'package:aplicativo/app/shared/Dados/models/pessoa_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActorViewWidget extends StatelessWidget {
  final List<Pessoa> pessoa;

  ActorViewWidget({required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Atores Principais",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Container(
            height: 150.0,
            child: SingleChildScrollView(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: pessoa.length,
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
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                        "https://image.tmdb.org/t/p/original" +
                                            pessoa[index].imagem)))),
                        Text(
                          pessoa[index].nome,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
