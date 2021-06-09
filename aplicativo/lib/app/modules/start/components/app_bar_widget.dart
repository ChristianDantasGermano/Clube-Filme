import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  @override
  AppBarWidgetState createState() => AppBarWidgetState();
}

class AppBarWidgetState extends State<AppBarWidget> {
  Icon searchIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Clube do Filme',
      style: TextStyle(
          color: Colors.black, fontSize: 35, fontFamily: 'Tangerine'));

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      floating: true, //floating do sliverAppBar
      forceElevated: true, //Força a conectar ao body do nestedScrollView
      title: cusSearchBar,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          icon: searchIcon,
          onPressed: () {
            setState(() {
              if (this.searchIcon.icon == Icons.search) {
                this.searchIcon = Icon(Icons.cancel);
                this.cusSearchBar = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Busque um filme"),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                );
              } else {
                this.searchIcon = Icon(Icons.search);
                this.cusSearchBar = Text('Clube do Filme',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'Tangerine'));
              }
            });
          },
        )
      ],
    );
  }
}
