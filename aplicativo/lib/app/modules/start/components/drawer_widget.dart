import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.petz.com.br/blog/wp-content/uploads/2020/02/cat-sitting.jpg'),
                          fit: BoxFit.fill)),
                ),
                Text(
                  'Gato de Teste',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Text(
                  'djkdjkqwl@gmail.com',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            'Perfil',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Configurações',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: null,
        ),
      ],
    ));
  }
}
