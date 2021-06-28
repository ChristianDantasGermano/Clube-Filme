import 'package:aplicativo/app/modules/start/pages/elenco/components/elenco_modal_widget.dart';
import 'package:aplicativo/app/modules/start/pages/elenco/elenco_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ElencoPage extends StatefulWidget {
  @override
  ElencoPageState createState() => ElencoPageState();
}

class ElencoPageState extends ModularState<ElencoPage, ElencoStore> {
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
                  Observer(builder: (_) {
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.pessoaPage!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 60.0,
                                  height: 60.0,
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
                                          image: new CachedNetworkImageProvider(
                                              controller.pessoaPage![index]
                                                          .imagem !=
                                                      ""
                                                  ? "https://image.tmdb.org/t/p/w200" +
                                                      controller
                                                          .pessoaPage![index]
                                                          .imagem
                                                  : "https://www.seekpng.com/png/detail/110-1100707_person-avatar-placeholder.png")))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.pessoaPage![index].nome,
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
                                        controller.cargo.toString(),
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
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
