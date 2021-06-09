import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final String title;
  const SliderWidget({Key? key, this.title = "SliderWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}
