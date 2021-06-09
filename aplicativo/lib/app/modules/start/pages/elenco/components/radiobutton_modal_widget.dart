import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class RadioButtonModal extends StatefulWidget {
  @override
  _RadioButtonModalState createState() => _RadioButtonModalState();
}

enum cargos { diretores, atores }

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonModalState extends State<RadioButtonModal> {
  cargos _character = cargos.diretores;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: RadioListTile<cargos>(
            title: const Text('Diretores'),
            value: cargos.diretores,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ),
        Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: RadioListTile<cargos>(
              title: const Text('Atores'),
              value: cargos.atores,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            )),
      ],
    );
  }
}
