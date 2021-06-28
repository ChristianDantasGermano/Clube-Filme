import 'package:aplicativo/app/modules/start/pages/filmes/components/radiobutton_modal_widget.dart';
import 'package:aplicativo/app/modules/start/pages/filmes/filmes_store.dart';
import 'package:aplicativo/app/shared/models/checkbox_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieModalWidget extends StatefulWidget {
  @override
  _MovieModalWidgetState createState() => _MovieModalWidgetState();
}

class _MovieModalWidgetState extends State<MovieModalWidget>
    with SingleTickerProviderStateMixin {
  FilmesStore filmes = Modular.get();

  bool organizacao =
      true; //Determina se é ordem alfabetica ou visualizacao (true -> alfabetica, false -> visualizacao)
  bool buttonArrow =
      true; //Determina se é ordem crescente ou descrecente baseada na direcao a seta (true -> crescente, false -> decrecente)
  TabController? _tabController;

  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "Ação"),
    CheckBoxModel(texto: "Aventura"),
    CheckBoxModel(texto: "Documentário"),
    CheckBoxModel(texto: "Romance"),
    CheckBoxModel(texto: "Comédia"),
  ];

  bool genero = true;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.001),
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.85,
            builder: (_, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  //Tabs
                  children: [
                    TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: 'Organização',
                        ),
                        Tab(
                          text: 'Gênero',
                        )
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //Tab 01 Ordenação
                          Container(
                            child: ListView(
                              children: <Widget>[
                                Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  child: ListTile(
                                    onTap: () => {
                                      setState(() {
                                        if (!organizacao) {
                                          buttonArrow = !buttonArrow;
                                        }
                                        organizacao = false;

                                        if (!organizacao && buttonArrow) {
                                          filmes.alfabeticoDecrescente();
                                        } else {
                                          filmes.alfabeticoCrescente();
                                        }
                                      })
                                    },
                                    leading: Icon(
                                      buttonArrow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up,
                                      color: organizacao
                                          ? Colors.white
                                          : Colors.black,
                                      size: 40.0,
                                    ),
                                    title: Text('Alfabética'),
                                  ),
                                ),
                                Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        if (organizacao) {
                                          buttonArrow = !buttonArrow;
                                        }
                                        organizacao = true;
                                      });
                                      if (organizacao && buttonArrow) {
                                        filmes.visualizacaoDecrescente();
                                      } else {
                                        filmes.visualizacaoCrescente();
                                      }
                                    },
                                    leading: Icon(
                                      buttonArrow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up,
                                      color: organizacao
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40.0,
                                    ),
                                    title: Text('Visualização'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Tab de escolha por Gênero
                          Container(
                            child: ListView.builder(
                              controller: controller,
                              itemCount: itens.length,
                              itemBuilder: (_, int index) {
                                return RadioButtonModal();
                              },
                            ),
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
