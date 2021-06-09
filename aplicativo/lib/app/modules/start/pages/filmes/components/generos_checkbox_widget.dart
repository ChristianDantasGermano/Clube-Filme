import 'package:aplicativo/app/shared/models/checkbox_model.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key, required this.item}) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(widget.item.texto),
          value: widget.item.checked,
          onChanged: (value) {
            setState(() {
              widget.item.checked = value!;
            });
          },
        ),
      ),
    );
  }
}
