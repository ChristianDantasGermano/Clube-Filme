import 'package:aplicativo/app/modules/start/pages/elenco/elenco_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// This is the stateful widget that the main application instantiates.
class RadioButtonModal extends StatefulWidget {
  @override
  _RadioButtonModalState createState() => _RadioButtonModalState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonModalState
    extends ModularState<RadioButtonModal, ElencoStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: RadioListTile<String>(
              title: const Text('Diretores'),
              value: "Diretores",
              groupValue: controller.cargo,
              onChanged: (value) {
                setState(() {
                  controller.setCargo(value!);
                });
              },
            ),
          ),
          Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              child: RadioListTile<String>(
                title: const Text('Atores'),
                value: "Atores",
                groupValue: controller.cargo,
                onChanged: (value) {
                  setState(() {
                    controller.setCargo(value!);
                  });
                },
              )),
        ],
      );
    });
  }
}
