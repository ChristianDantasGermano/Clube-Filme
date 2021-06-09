import 'package:aplicativo/app/modules/start/pages/elenco/components/radiobutton_modal_widget.dart';
import 'package:aplicativo/app/shared/models/checkbox_model.dart';
import 'package:flutter/material.dart';

class ElencoModalWidget extends StatefulWidget {
  @override
  _ElencoModalWidgetState createState() => _ElencoModalWidgetState();
}

class _ElencoModalWidgetState extends State<ElencoModalWidget>
    with SingleTickerProviderStateMixin {
  bool organizacao =
      true; //Determina se é ordem alfabetica ou visualizacao (true -> alfabetica, false -> visualizacao)
  bool buttonArrow =
      true; //Determina se é ordem crescente ou descrecente baseada na direcao a seta (true -> crescente, false -> decrecente)
  TabController? _tabController;

  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "Direção"),
    CheckBoxModel(texto: "Atores"),
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
                  children: [
                    TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: 'Organização',
                        ),
                        Tab(
                          text: 'Cargos',
                        )
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: ListView(
                              children: <Widget>[
                                Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  child: ListTile(
                                    onTap: () => setState(() {
                                      if (!organizacao) {
                                        buttonArrow = !buttonArrow;
                                      }
                                      organizacao = false;
                                    }),
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
                                    onTap: () => setState(() {
                                      if (organizacao) {
                                        buttonArrow = !buttonArrow;
                                      }
                                      organizacao = true;
                                    }),
                                    leading: Icon(
                                      buttonArrow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up,
                                      color: organizacao
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40.0,
                                    ),
                                    title: Text('Popularidade'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RadioButtonModal(),
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
