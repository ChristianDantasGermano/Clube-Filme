import 'package:aplicativo/app/modules/start/pages/filmes/filmes_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// This is the stateful widget that the main application instantiates.
class RadioButtonModal extends StatefulWidget {
  @override
  _RadioButtonModalState createState() => _RadioButtonModalState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonModalState
    extends ModularState<RadioButtonModal, FilmesStore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Ação'),
            value: 'ação',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Aventura'),
            value: 'aventura',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Animação'),
            value: 'animação',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Comédia'),
            value: 'comédia',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Crime'),
            value: 'crime',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Documentário'),
            value: 'documentário',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Drama'),
            value: 'drama',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Família'),
            value: 'família',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Fantasia'),
            value: 'fantasia',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('História'),
            value: 'história',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Terror'),
            value: 'terror',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Música'),
            value: 'música',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Mistério'),
            value: 'mistério',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Romance'),
            value: 'romance',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Ficção científica'),
            value: 'ficçãocientífica',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('CinemaTV'),
            value: 'cinemaTV',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Thriller'),
            value: 'thriller',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Guerra'),
            value: 'guerra',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<String>(
            title: const Text('Faroeste'),
            value: 'faroeste',
            groupValue: controller.getGenero(),
            onChanged: (value) {
              setState(() {
                controller.setGenero(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
